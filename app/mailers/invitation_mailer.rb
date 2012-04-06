class InvitationMailer < ActionMailer::Base

  default :from => "Bob@Hackternoon.com",
          :return_path => "Bob@Hackternoon.com",
          :subject => "Invitation Conveyed by Hackternoon.com"

  # Demo: InvitationMailer.mail_rcvr(@invitation).deliver
  # Usually called here: models/invitation.rb
  def mail_rcvr invitation
    @invitation = invitation
    mail :to => @invitation.user.email
  end

  # Demo: InvitationMailer.mail_sender(@invitation).deliver
  def mail_sender invitation
    @invitation = invitation
    mail :to    => @invitation.project.user.email
  end

end
