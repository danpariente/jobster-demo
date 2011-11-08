class RegistrationsController < Devise::RegistrationsController
  def create
    session["#{resource_name}_return_to"] = current_user#complete_path
    super
  end
	
  protected

  def after_sign_up_path_for(resource)
    'http://www.google.com'
  end
end