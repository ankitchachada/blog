class Api::V1::RegistrationsController < Devise::RegistrationsController

	before_action :configure_permitted_parameters
	respond_to :json
	

	private
	
	def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) do
        params[:user].permit(:email, :password, :password_confirmation, :username,:name)
      end
    end
end