class Api::V1::BaseController < ActionController::Base
  acts_as_token_authentication_handler_for User, except: [:index, :show]
  respond_to :json
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :permission_denied

  # def self.authenticated!(options = {})
  #   before_action :authenticate_user!, only: [:index]
  # end

  def permission_denied(exception)
    if exception.record.errors.messages[:error]
      render json: {message: "Unauthorized Access"}, status: :forbidden
    else
      head 403
    end
  end
end
