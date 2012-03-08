class InvitationMailer < ActionMailer::Base
  default from: "Bob@Hackternoon.com"

  # Demo: InvitationMailer.mail_rcvr('dan@bot4.us').deliver
  def mail_rcvr rcvr
    mail :to => rcvr
  end

  # Demo: InvitationMailer.mail_sender('dan@hackternoon.com').deliver
  def mail_sender sender
    mail :to => sender
  end
end
