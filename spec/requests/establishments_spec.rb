require "rails_helper"

RSpec.describe "Establishments", type: :request do
  def path(property, neighborhood, establishment = nil)
    base = "/api/properties/#{property.id}/neighborhoods/#{neighborhood.id}/establishments"
    establishment ? "#{base}/#{establishment.id}" : base
  end

  describe "GET /api/properties/:property_id/neighborhoods/:neighborhood_id/establishments" do
    it "lists establishments for a guest" do
      property = create_property
      neighborhood = property.neighborhoods.create!(neighborhood_attributes)
      establishment = neighborhood.establishments.create!(establishment_attributes)

      get path(property, neighborhood), headers: authorization_header(create_guest)

      expect(response).to have_http_status(:ok)
      expect(json_response.map { |row| row["id"] }).to contain_exactly(establishment.id)
    end
  end

  describe "POST /api/properties/:property_id/neighborhoods/:neighborhood_id/establishments" do
    it "forbids a guest" do
      property = create_property
      neighborhood = property.neighborhoods.create!(neighborhood_attributes)

      post path(property, neighborhood),
        params: { establishment: establishment_attributes },
        headers: authorization_header(create_guest),
        as: :json

      expect(response).to have_http_status(:forbidden)
    end

    it "creates an establishment for an admin and links it to the neighborhood" do
      property = create_property
      neighborhood = property.neighborhoods.create!(neighborhood_attributes)

      post path(property, neighborhood),
        params: { establishment: establishment_attributes },
        headers: authorization_header(create_admin),
        as: :json

      expect(response).to have_http_status(:created)
      expect(json_response["name"]).to eq("Cafe")
      expect(neighborhood.establishments.find_by(name: "Cafe")).to be_present
    end
  end

  describe "PATCH /api/properties/:property_id/neighborhoods/:neighborhood_id/establishments/:id" do
    it "updates an establishment for an admin" do
      property = create_property
      neighborhood = property.neighborhoods.create!(neighborhood_attributes)
      establishment = neighborhood.establishments.create!(establishment_attributes)

      patch path(property, neighborhood, establishment),
        params: { establishment: { name: "Renamed Cafe" } },
        headers: authorization_header(create_admin),
        as: :json

      expect(response).to have_http_status(:ok)
      expect(establishment.reload.name).to eq("Renamed Cafe")
    end
  end

  describe "DELETE /api/properties/:property_id/neighborhoods/:neighborhood_id/establishments/:id" do
    it "deletes an establishment for an admin" do
      property = create_property
      neighborhood = property.neighborhoods.create!(neighborhood_attributes)
      establishment = neighborhood.establishments.create!(establishment_attributes)

      delete path(property, neighborhood, establishment), headers: authorization_header(create_admin)

      expect(response).to have_http_status(:ok)
      expect(json_response["message"]).to eq("Establishment deleted successfully")
      expect(Establishment.exists?(establishment.id)).to be(false)
    end
  end
end
