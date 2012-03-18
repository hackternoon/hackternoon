class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:user_id])
    @projects = @user.projects
    @invitations = @user.invitations
    @projects_invited_to = @user.projects_invited_to
  end

end
