class InvitationMailer < ActionMailer::Base
  attr_accessor :project_id, :rcvr_email, :rcvr_id
  default from: "Bob@Hackternoon.com"

  # Demo: InvitationMailer.mail_rcvr('dan@bot4.us', project_id).deliver
  def mail_rcvr rcvr, project_id
    @project_id = project_id
    mail :to => rcvr
  end

  # Demo: InvitationMailer.mail_sender('dan@hackternoon.com', 'dan@bot4.us', 10, 2).deliver
  def mail_sender sender, rcvr, project_id, rcvr_id
    @rcvr_email = rcvr
    @project_id = project_id
    @rcvr_id    = rcvr_id
    mail :to    => sender
  end

end
