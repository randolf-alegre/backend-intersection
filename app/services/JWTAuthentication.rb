class JWTAuthentication
  ACTOR_TYPES = { "Guest" => Guest, "User" => User }.freeze
  SECRET_KEY = Rails.application.credentials.secret_key_base

  def self.generate_token(actor)
    JWT.encode({ actor_type: actor.class.name, actor_id: actor.id, exp: 24.hours.from_now.to_i }, SECRET_KEY, 'HS256')
  end

  def self.decode_token(token)
    JWT.decode(token, SECRET_KEY, true, { algorithm: 'HS256' })
  end
end