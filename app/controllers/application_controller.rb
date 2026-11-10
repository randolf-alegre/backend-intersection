class ApplicationController < ActionController::API
  class Forbidden < StandardError; end

  before_action :authenticate_request
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from JWT::DecodeError, with: :invalid_token
  rescue_from Forbidden, with: :forbidden

  attr_reader :current_actor

  def authenticate_request
    header = request.headers["Authorization"]
    return invalid_token if header.blank?
    token = header.split(" ").last
    payload = JWTAuthentication.decode_token(token).first
    klass = JWTAuthentication::ACTOR_TYPES[payload["actor_type"]]
    return invalid_token unless klass
    @current_actor = klass.find(payload["actor_id"])
  rescue ActiveRecord::RecordNotFound, JWT::DecodeError
    invalid_token
  end

  def require_user
    raise Forbidden unless current_actor.is_a?(User)
  end

  def require_admin
    raise Forbidden unless current_actor.is_a?(User) && current_actor.admin?
  end

  def require_guest
    raise Forbidden unless current_actor.is_a?(Guest)
  end

  private
  DEFAULT_PER_PAGE = 10

  def paginated(scope, key = :properties)
    records = scope.order(:id).limit(per_page + 1).offset((page - 1) * per_page).to_a
    {
      key => records.first(per_page),
      has_next_page: records.size > per_page
    }
  end

  def page
    number = params[:page].to_i
    number.positive? ? number : 1
  end

  def per_page
    number = params[:per_page].to_i
    number.positive? ? number : DEFAULT_PER_PAGE
  end

  def record_not_found
    render json: { error: "Record not found" }, status: :not_found
  end

  def invalid_token
    render json: { error: "Unauthorized" }, status: :unauthorized
  end

  def forbidden
    render json: { error: "Forbidden" }, status: :forbidden
  end
end
