require "rails_helper"

RSpec.describe "Properties", type: :request do
  describe "GET /api/properties" do
    it "requires a token" do
      get "/api/properties"

      expect(response).to have_http_status(:unauthorized)
      expect(json_response["error"]).to eq("Unauthorized")
    end

    it "lists properties for a guest" do
      property = create_property

      get "/api/properties", headers: authorization_header(create_guest)

      expect(response).to have_http_status(:ok)
      expect(json_response["properties"].map { |row| row["id"] }).to contain_exactly(property.id)
      expect(json_response["hasNextPage"]).to be(false)
    end

    it "returns 10 properties per page by default" do
      properties = 12.times.map { |index| create_property(name: "Inn #{index}") }

      get "/api/properties", headers: authorization_header(create_guest)

      expect(response).to have_http_status(:ok)
      expect(json_response["properties"].map { |row| row["id"] }).to eq(properties.first(10).map(&:id))
      expect(json_response["hasNextPage"]).to be(true)
    end

    it "returns the requested page" do
      properties = 12.times.map { |index| create_property(name: "Inn #{index}") }

      get "/api/properties", params: { page: 2 }, headers: authorization_header(create_guest)

      expect(response).to have_http_status(:ok)
      expect(json_response["properties"].map { |row| row["id"] }).to eq(properties.last(2).map(&:id))
      expect(json_response["hasNextPage"]).to be(false)
    end
  end

  describe "GET /api/properties/search" do
    it "requires a token" do
      get "/api/properties/search", params: { name: "Hatchobori" }

      expect(response).to have_http_status(:unauthorized)
    end

    it "returns the property with that name" do
      property = create_property(name: "Hatchobori")

      get "/api/properties/search", params: { name: "Hatchobori" }, headers: authorization_header(create_guest)

      expect(response).to have_http_status(:ok)
      expect(json_response["properties"].map { |row| row["id"] }).to contain_exactly(property.id)
      expect(json_response["properties"].map { |row| row["name"] }).to contain_exactly("Hatchobori")
      expect(json_response["hasNextPage"]).to be(false)
    end

    it "matches the name regardless of case" do
      property = create_property(name: "Hatchobori")

      get "/api/properties/search", params: { name: "hatchobori" }, headers: authorization_header(create_guest)

      expect(response).to have_http_status(:ok)
      expect(json_response["properties"].map { |row| row["id"] }).to contain_exactly(property.id)
    end

    it "returns 10 matches per page and whether another page exists" do
      properties = 12.times.map { create_property(name: "Hatchobori") }

      get "/api/properties/search", params: { name: "hatchobori" }, headers: authorization_header(create_guest)

      expect(response).to have_http_status(:ok)
      expect(json_response["properties"].map { |row| row["id"] }).to eq(properties.first(10).map(&:id))
      expect(json_response["hasNextPage"]).to be(true)

      get "/api/properties/search", params: { name: "hatchobori", page: 2 }, headers: authorization_header(create_guest)

      expect(response).to have_http_status(:ok)
      expect(json_response["properties"].map { |row| row["id"] }).to eq(properties.last(2).map(&:id))
      expect(json_response["hasNextPage"]).to be(false)
    end

    it "returns not found when no property has that name" do
      get "/api/properties/search", params: { name: "Missing" }, headers: authorization_header(create_guest)

      expect(response).to have_http_status(:not_found)
      expect(json_response["error"]).to eq("Property not found")
    end
  end

  describe "POST /api/properties" do
    let(:params) { { property: { name: "Inn", address: "1 Main Street", description: "A place to stay" } } }

    it "forbids a guest" do
      post "/api/properties", params: params, headers: authorization_header(create_guest), as: :json

      expect(response).to have_http_status(:forbidden)
    end

    it "forbids a user who is not an admin" do
      post "/api/properties", params: params, headers: authorization_header(create_user), as: :json

      expect(response).to have_http_status(:forbidden)
    end

    it "creates a property for an admin" do
      post "/api/properties", params: params, headers: authorization_header(create_admin), as: :json

      expect(response).to have_http_status(:ok)
      expect(json_response["name"]).to eq("Inn")
      expect(Property.find_by(name: "Inn")).to be_present
    end
  end

  describe "PATCH /api/properties/:id" do
    it "updates a property for an admin" do
      property = create_property

      patch "/api/properties/#{property.id}",
        params: { property: { name: "Renamed" } },
        headers: authorization_header(create_admin),
        as: :json

      expect(response).to have_http_status(:ok)
      expect(property.reload.name).to eq("Renamed")
    end

    it "returns not found for a missing property" do
      patch "/api/properties/0",
        params: { property: { name: "Renamed" } },
        headers: authorization_header(create_admin),
        as: :json

      expect(response).to have_http_status(:not_found)
      expect(json_response["error"]).to eq("Record not found")
    end
  end

  describe "DELETE /api/properties/:id" do
    it "deletes a property for an admin" do
      property = create_property

      delete "/api/properties/#{property.id}", headers: authorization_header(create_admin)

      expect(response).to have_http_status(:ok)
      expect(json_response["message"]).to eq("Property deleted successfully")
      expect(Property.exists?(property.id)).to be(false)
    end
  end
end
