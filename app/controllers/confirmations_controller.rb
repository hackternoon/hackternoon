# confirmations_controller.rb
	
class ConfirmationsController < Devise::ConfirmationsController

  # Control flows here when user asks for a confirmation token.
  # Currently all it does is build a resource and render a form.
  def new
    # In development and test I want to see the recent conf-tokens:
    if ENV['RAILS_ENV'] == 'production'
      @conf_tokens = [User.new]
    else
      @conf_tokens = User.select("email, confirmation_token").order(:updated_at).reverse_order.limit(100)
    end
    # Now move along:
    super
  end

  # POST /resource/confirmation
  def create
    self.resource = resource_class.send_confirmation_instructions(params[resource_name])
    set_flash_message :notice, :send_paranoid_instructions
    redirect_to root_path
  end

  # Control flows here when user follows URL in e-mail.
  def show
    @user = User.find_by_confirmation_token(params[:confirmation_token])
    if @user.blank?
      render :confirm_user_failed
    end
  end

  # Control flows here when user submits new-password to this form:
  # app/views/confirmations/show.html.haml
  def confirm_user
    @user = User.find_by_confirmation_token(params[:user][:confirmation_token])
    if @user.blank?
      render :confirm_user_failed
      return
    end      
    # Slim down the hash I send to Devise to avoid Mass-Update-problems:
    params_user = {'name' => params[:user][:name], 
                   'password' => params[:user][:password], 
                   'password_confirmation' => params[:user][:password_confirmation]
                  }
    if @user.update_attributes(params_user) and @user.password_match?
      @user = User.confirm_by_token(@user.confirmation_token)
      set_flash_message :notice, :confirmed      
      sign_in_and_redirect("user", @user)
    else
      render :confirm_user_failed
      return
    end # if
  end # def confirm_user

end
