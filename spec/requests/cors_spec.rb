require "rails_helper"

RSpec.describe "CORS", type: :request do
  it "answers a preflight request from the local frontend" do
    options "/api/login", headers: {
      "Origin" => "http://localhost:5173",
      "Access-Control-Request-Method" => "POST",
      "Access-Control-Request-Headers" => "Content-Type, Authorization"
    }

    expect(response).to have_http_status(:ok)
    expect(response.headers["Access-Control-Allow-Origin"]).to eq("http://localhost:5173")
    expect(response.headers["Access-Control-Allow-Methods"]).to include("POST")
  end

  it "answers a preflight request from a Vercel deployment" do
    options "/api/login", headers: {
      "Origin" => "https://section-l.vercel.app",
      "Access-Control-Request-Method" => "GET",
      "Access-Control-Request-Headers" => "Content-Type, Authorization"
    }

    expect(response).to have_http_status(:ok)
    expect(response.headers["Access-Control-Allow-Origin"]).to eq("https://section-l.vercel.app")
    expect(response.headers["Access-Control-Allow-Headers"]).to include("Authorization")
  end

  it "does not allow a preflight request from another origin" do
    options "/api/login", headers: {
      "Origin" => "https://example.com",
      "Access-Control-Request-Method" => "POST"
    }

    expect(response.headers["Access-Control-Allow-Origin"]).to be_nil
  end
end
