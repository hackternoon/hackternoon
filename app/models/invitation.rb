class Invitation < ActiveRecord::Base
  # I limit the number of invitations you can mail out.
  # If you want more, just look at their e-mail address and then use gmail:
  @@iinvitation_limit = 30
  def self.invitation_limit
    @@iinvitation_limit
  end

  attr_accessor :rcvr_email
  belongs_to :project
  belongs_to :user

  attr_accessible :msg,:project_id,:sender_id,:user_id

  before_create :get_rcvr
  after_create  :alert_rcvr
  after_create  :alert_sender


  # If the invitation was sent already, the controller wants to know.
  # An invitation can be identified by the combo of:
  # rcvr_email
  # project_id
  def sent_already?
    @user = User.find_by_email(self.rcvr_email)
    return false if @user.blank?
    @sent_invitation = Invitation.where("user_id = ? AND project_id = ?", @user.id, self.project_id)
    if @sent_invitation.present?
      return true
    else
      return false
    end
  end

  # I use this method to get a @user to receive the invitation.
  # If @user does not exist in the site yet, I use Devise to create it.
  # Be aware that Devise will send e-mail to an actual person asking them to register.
  def get_rcvr
    @user = User.find_by_email self.rcvr_email
    if @user.blank?
      # I'll use Devise here to register a new user:
      @user = User.new(:email => self.rcvr_email)
      @user.save # Devise should send out an e-mail here.
    end
    self.user_id = @user.id
  end # def get_rcvr

  # Alert the rcvr that an invitation was sent
  def alert_rcvr
    InvitationMailer.mail_rcvr(user.email, project_id).deliver
  end

  # Alert the sender that an invitation was sent
  def alert_sender
    sender_email = self.project.user.email
    rcvr_email = self.user.email
    rcvr_id = self.user_id
    InvitationMailer.mail_sender(sender_email, rcvr_email, self.project_id, rcvr_id).deliver
  end

end
