# Be sure to restart your server when you modify this file.

local_origins = /\Ahttp:\/\/(localhost|127\.0\.0\.1)(:\d+)?\z/
vercel_origins = /\Ahttps:\/\/[\w.-]+\.vercel\.app\z/
configured_origins = ENV.fetch("CORS_ORIGINS", "").split(",").map(&:strip).reject(&:empty?)

allowed_origins = [ vercel_origins, *configured_origins ]
allowed_origins << local_origins unless Rails.env.production?

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins(*allowed_origins)

    resource "*",
      headers: :any,
      methods: [ :get, :post, :put, :patch, :delete, :options, :head ]
  end
end
