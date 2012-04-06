class PitchMailer < ActionMailer::Base

  attr_accessor :pitch

  default :from => "Bob@Hackternoon.com",
          :return_path => "Bob@Hackternoon.com",
          :subject => "Pitch Conveyed by Hackternoon.com"

  # Demo: PitchMailer.mail_pitcher(@pitch).deliver
  # This method is usaully called from models/pitch.rb.
  # Keep in mind that the pitch-object contains all info needed for the outgoing e-mail:
  # The sender, receiver, and the reason or intent behind the pitch.
  def mail_pitcher pitch
    @pitch = pitch
    mail :to => @pitch.user.email
  end # def mail_pitcher 

end
