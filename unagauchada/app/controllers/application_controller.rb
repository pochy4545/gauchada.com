class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #Damos permiso para traer los datos del usuario para poder editarlo
  before_filter :configure_permitted_parameters, if: :devise_controller?
  	protected
  	def configure_permitted_parameters
  		devise_parameter_sanitizer.permit(:sign_up) do |user_params|
    	user_params.permit({ roles: [] }, :nombre, :email, :password, :password_confirmation, :apellido, :telefono, :fecha_de_nacimiento, :cover,:creditos) 
		end
		devise_parameter_sanitizer.permit(:account_update) do |user_params|
    	user_params.permit({ roles: [] }, :nombre, :email, :apellido, :telefono, :current_password, :password, :password_confirmation, :fecha_de_nacimiento, :cover,:creditos)
		end
	end
end
