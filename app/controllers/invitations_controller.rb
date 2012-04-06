class InvitationsController < ApplicationController

  # POST /invitations
  # POST /invitations.json
  # I intend for params to this action to be collected here:
  #   app/views/projects/show.html.haml
  #   app/views/projects/_invitation_form.html.haml
  def create
    @project = Project.find params[:project_id]
    # An invitation with no project is useless:
    if @project.blank?
      redirect_to '/', notice: 'You are here because invitation needs project.'
      return
    end
    # Ensure I own this project
    if @project.user_id != current_user.id
      redirect_to '/', notice: 'You are here because of a data problem in the last POST.'
      return
    end
    # Now that I'm happy with the @project, work on @invitation:

    if current_user.invitations.count > Invitation.invitation_limit
      redirect_to '/', notice: "You are out of invitations. You only get #{nvitation.invitation_limit}."
      return
    end

    @invitation = Invitation.new
    @invitation.project_id = params[:project_id]
    @invitation.rcvr_email = params[:rcvr_email]
    if @invitation.sent_already?
      redirect_to @project, notice: "Invitation Sent Once Already"
      return
    end
    # All I need now is @user.id for the receiver.
    # A row in users might not exist for @user yet.
    # I depend on a before_create callback in models/invitation.rb to create the row if nec.
    if @invitation.save
      the_notice = "Invitation sent to: #{params[:rcvr_email]}"
      the_notice << ", and copy sent to: #{current_user.email}"
      redirect_to @project, notice: the_notice
    else
      redirect_to '/', notice: 'You are here because of a data problem in the last POST.'
    end
  end # def create

end
