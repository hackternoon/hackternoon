class PasswordsController < Devise::PasswordsController

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

