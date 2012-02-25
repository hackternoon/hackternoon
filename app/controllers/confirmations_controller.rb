# confirmations_controller.rb
	
class ConfirmationsController < Devise::ConfirmationsController
  def show
    @user = User.find_by_confirmation_token(params[:confirmation_token])
    if !@user.present?
      render :new
    end
  end

  def confirm_user
    #     @user = User.find(params[:user][:confirmation_token])
    @user = User.find_by_confirmation_token(params[:user][:confirmation_token])
    if @user.update_attributes(params[:user]) and @user.password_match?
      @user = User.confirm_by_token(@user.confirmation_token)
      set_flash_message :notice, :confirmed      
      sign_in_and_redirect("user", @user)
    else
      render :action => "show"
    end
  end

end
