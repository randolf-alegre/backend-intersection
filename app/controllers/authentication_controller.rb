class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request, only: [:login, :refresh]
  before_action :require_login_params, only: :login
  before_action :require_refresh_params, only: :refresh

  def login
    actor = if login_params[:keycard_token].present?
      Guest.find_by(keycard_token: login_params[:keycard_token])
    else
      user = User.find_by(email: login_params[:email])
      user&.authenticate(login_params[:password])
    end
  
    return render json: { error: "Unauthorized" }, status: :unauthorized unless actor
  
    render json: {
      token: JWTAuthentication.generate_token(actor),
      refresh_token: actor.generate_token_for(:refresh)
    }
  end

  def refresh
    token = refresh_params[:refresh_token]
    actor = Guest.find_by_token_for(:refresh, token) || User.find_by_token_for(:refresh, token)
    return render json: { error: "Unauthorized" }, status: :unauthorized unless actor

    render json: { token: JWTAuthentication.generate_token(actor) }
  end

  private

  def require_login_params
    guest_login = login_params[:keycard_token].present?
    user_login = login_params[:email].present? && login_params[:password].present?
    return if guest_login || user_login
    raise ActionController::ParameterMissing, "keycard_token or email and password"
  end
  def login_params
    params.permit(:keycard_token, :email, :password)
  end

  def require_refresh_params
    params.require(:refresh_token)
  end

  def refresh_params
    params.permit(:refresh_token)
  end
end
