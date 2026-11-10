require "rails_helper"

RSpec.describe "Authentication", type: :request do
  describe "POST /api/login" do
    it "logs in a guest with a keycard token" do
      guest = create_guest

      post "/api/login", params: { keycard_token: guest.keycard_token }, as: :json

      expect(response).to have_http_status(:ok)
      payload = JWTAuthentication.decode_token(json_response["token"]).first
      expect(payload["actor_type"]).to eq("Guest")
      expect(payload["actor_id"]).to eq(guest.id)
      expect(Guest.find_by_token_for(:refresh, json_response["refreshToken"])).to eq(guest)
    end

    it "logs in a user with email and password" do
      user = create_admin

      post "/api/login", params: { email: user.email, password: "secret123" }, as: :json

      expect(response).to have_http_status(:ok)
      payload = JWTAuthentication.decode_token(json_response["token"]).first
      expect(payload["actor_type"]).to eq("User")
      expect(payload["actor_id"]).to eq(user.id)
    end

    it "rejects an unknown keycard" do
      post "/api/login", params: { keycard_token: "missing" }, as: :json

      expect(response).to have_http_status(:unauthorized)
      expect(json_response["error"]).to eq("Unauthorized")
    end

    it "rejects a wrong password" do
      user = create_admin

      post "/api/login", params: { email: user.email, password: "wrong" }, as: :json

      expect(response).to have_http_status(:unauthorized)
    end

    it "rejects a request without login params" do
      post "/api/login", params: {}, as: :json

      expect(response).to have_http_status(:bad_request)
    end
  end

  describe "POST /api/refresh" do
    it "issues a new access token for a guest" do
      guest = create_guest

      post "/api/refresh", params: { refresh_token: guest.generate_token_for(:refresh) }, as: :json

      expect(response).to have_http_status(:ok)
      payload = JWTAuthentication.decode_token(json_response["token"]).first
      expect(payload["actor_type"]).to eq("Guest")
      expect(payload["actor_id"]).to eq(guest.id)
    end

    it "issues a new access token for a user" do
      user = create_admin

      post "/api/refresh", params: { refresh_token: user.generate_token_for(:refresh) }, as: :json

      expect(response).to have_http_status(:ok)
      payload = JWTAuthentication.decode_token(json_response["token"]).first
      expect(payload["actor_type"]).to eq("User")
      expect(payload["actor_id"]).to eq(user.id)
    end

    it "rejects an unknown refresh token" do
      post "/api/refresh", params: { refresh_token: "not-a-token" }, as: :json

      expect(response).to have_http_status(:unauthorized)
      expect(json_response["error"]).to eq("Unauthorized")
    end

    it "rejects a request without a refresh token" do
      post "/api/refresh", params: {}, as: :json

      expect(response).to have_http_status(:bad_request)
    end
  end
end
