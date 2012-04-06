class Pitch < ActiveRecord::Base
  # I limit the number of pitches you can mail out.
  # If you want more, just look at their e-mail address and then use gmail:
  @@ppitch_limit = 30
  def self.pitch_limit
    @@ppitch_limit
  end

  belongs_to :project
  belongs_to :user

  attr_accessible :msg

  after_create  :alert_pitcher
  after_create  :alert_project_owner

  # Alert the pitcher that he/she sent a pitch.
  def alert_pitcher
    PitchMailer.mail_pitcher(self).deliver
  end

  # Alert project-owner he/she got a pitch.
  def alert_project_owner
    PitchMailer.mail_project_owner(self).deliver
  end
end
