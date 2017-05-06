class Api::V1::SessionsController < Devise::SessionsController
  
  respond_to :json
  
  def create
    resource = User.find_for_database_authentication(:email=>params[:user][:email])
    return invalid_login_attempt unless resource
    if resource.valid_password?(params[:user][:password])
      sign_in("user", resource)
      render :json=> {:success=>true, :id => resource.id ,:email => resource.email,:authentication_token => resource.authentication_token}
      return
    end
    invalid_login_attempt
  end

  protected

    def invalid_login_attempt
      warden.custom_failure!
      render :json=> {:success=>false, :message=>"Error with your login or password"}, :status=>401
    end

end
