class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:user_id])
    @projects = @user.projects
    @invitations = @user.invitations
    @projects_invited_to = @user.projects_invited_to
    @profile_photo_url = @user.photo_urls.select("the_url").where('profile_photo = ?', true).first
    @pitches = @user.pitches
    @projects_pitched_to = @user.projects_pitched_to
  end

end
