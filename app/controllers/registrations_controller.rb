class RegistrationsController < Devise::RegistrationsController
  # I define create here so it is easier for me to step through devise-doings with the debugger.
  def create
    super
  end

end

