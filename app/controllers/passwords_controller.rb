class PasswordsController < Devise::PasswordsController

  # Control flows here after user submits e-mail address to form for password reset:
  def create
    self.resource = resource_class.send_reset_password_instructions(params[resource_name])
    set_flash_message :notice, :send_instructions
    redirect_to root_path
  end

  def new
    super
  end

  def edit
    super
  end

  def update
    super
  end

end

