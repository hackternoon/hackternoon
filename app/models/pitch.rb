class Pitch < ActiveRecord::Base
  # I limit the number of pitches a you can mail out.
  # If you want more, just look at their e-mail address and then use gmail:
  @@ppitch_limit = 30
  def self.pitch_limit
    @@ppitch_limit
  end

  belongs_to :project
  belongs_to :user

  attr_accessible :msg
  after_create  :alert_pitcher

  # Alert the pitcher that he/she sent a pitch.
  def alert_pitcher
    PitchMailer.mail_pitcher(self).deliver
  end # def alert_pitcher

end
