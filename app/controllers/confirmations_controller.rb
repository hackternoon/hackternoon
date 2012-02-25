# confirmations_controller.rb
	
class ConfirmationsController < Devise::ConfirmationsController
  def show
    @user = User.find_by_confirmation_token(params[:confirmation_token])
    if !@user.present?
      render :new
    end
  end

  def confirm_user
    @user = User.find_by_confirmation_token(params[:user][:confirmation_token])
    # Slim down the hash I send to Devise to avoid Mass-Update-problems:
    params_user = {'name' => params[:user][:name], 'password' => params[:user][:password], 'password_confirmation' => params[:user][:password_confirmation] }
    if @user.update_attributes(params_user) and @user.password_match?
      @user = User.confirm_by_token(@user.confirmation_token)
      set_flash_message :notice, :confirmed      
      sign_in_and_redirect("user", @user)
    else
      render :action => "show"
    end
  end

end
