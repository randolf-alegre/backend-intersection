# Be sure to restart your server when you modify this file.

local_origins = /\Ahttp:\/\/(localhost|127\.0\.0\.1)(:\d+)?\z/
configured_origins = ENV.fetch("CORS_ORIGINS", "").split(",").map(&:strip).reject(&:empty?)

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins(Rails.env.production? ? configured_origins : local_origins)

    resource "*",
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
