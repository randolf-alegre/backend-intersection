require "rails_helper"

RSpec.describe "Neighborhoods", type: :request do
  describe "GET /api/neighborhoods/all" do
    it "requires a token" do
      get "/api/neighborhoods/all"

      expect(response).to have_http_status(:unauthorized)
      expect(json_response["error"]).to eq("Unauthorized")
    end

    it "forbids a guest" do
      get "/api/neighborhoods/all", headers: authorization_header(create_guest)

      expect(response).to have_http_status(:forbidden)
      expect(json_response["error"]).to eq("Forbidden")
    end

    it "lists every neighborhood for an admin" do
      first_neighborhood = Neighborhood.create!(neighborhood_attributes(name: "Makati"))
      second_neighborhood = Neighborhood.create!(neighborhood_attributes(name: "BGC"))

      get "/api/neighborhoods/all", headers: authorization_header(create_admin)

      expect(response).to have_http_status(:ok)
      expect(json_response.map { |row| row["id"] }).to contain_exactly(first_neighborhood.id, second_neighborhood.id)
    end
  end

  describe "GET /api/properties/:property_id/neighborhoods" do
    it "lists neighborhoods for a guest" do
      property = create_property
      neighborhood = property.neighborhoods.create!(neighborhood_attributes)

      get "/api/properties/#{property.id}/neighborhoods", headers: authorization_header(create_guest)

      expect(response).to have_http_status(:ok)
      expect(json_response.map { |row| row["id"] }).to contain_exactly(neighborhood.id)
    end

    it "returns not found when the property does not exist" do
      get "/api/properties/0/neighborhoods", headers: authorization_header(create_guest)

      expect(response).to have_http_status(:not_found)
    end
  end

  describe "POST /api/properties/:property_id/neighborhoods" do
    it "forbids a guest" do
      property = create_property

      post "/api/properties/#{property.id}/neighborhoods",
        params: { neighborhood: neighborhood_attributes },
        headers: authorization_header(create_guest),
        as: :json

      expect(response).to have_http_status(:forbidden)
    end

    it "creates a neighborhood for an admin and links it to the property" do
      property = create_property

      post "/api/properties/#{property.id}/neighborhoods",
        params: { neighborhood: neighborhood_attributes },
        headers: authorization_header(create_admin),
        as: :json

      expect(response).to have_http_status(:created)
      expect(json_response["name"]).to eq("Makati")
      expect(property.neighborhoods.find_by(name: "Makati")).to be_present
    end
  end

  describe "PATCH /api/properties/:property_id/neighborhoods/:id" do
    it "updates a neighborhood for an admin" do
      property = create_property
      neighborhood = property.neighborhoods.create!(neighborhood_attributes)

      patch "/api/properties/#{property.id}/neighborhoods/#{neighborhood.id}",
        params: { neighborhood: { name: "BGC" } },
        headers: authorization_header(create_admin),
        as: :json

      expect(response).to have_http_status(:ok)
      expect(neighborhood.reload.name).to eq("BGC")
    end

    it "returns not found when the neighborhood belongs to another property" do
      property = create_property
      other_property = create_property(name: "Other")
      neighborhood = other_property.neighborhoods.create!(neighborhood_attributes(name: "Elsewhere"))

      patch "/api/properties/#{property.id}/neighborhoods/#{neighborhood.id}",
        params: { neighborhood: { name: "BGC" } },
        headers: authorization_header(create_admin),
        as: :json

      expect(response).to have_http_status(:not_found)
    end
  end

  describe "DELETE /api/properties/:property_id/neighborhoods/:id" do
    it "deletes a neighborhood for an admin" do
      property = create_property
      neighborhood = property.neighborhoods.create!(neighborhood_attributes)

      delete "/api/properties/#{property.id}/neighborhoods/#{neighborhood.id}",
        headers: authorization_header(create_admin)

      expect(response).to have_http_status(:ok)
      expect(json_response["message"]).to eq("Neighborhood deleted successfully")
      expect(Neighborhood.exists?(neighborhood.id)).to be(false)
    end
  end
end
