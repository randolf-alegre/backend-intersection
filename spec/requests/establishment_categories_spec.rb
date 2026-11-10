require "rails_helper"

RSpec.describe "Establishment categories", type: :request do
  describe "GET /api/establishment_categories" do
    it "requires a token" do
      get "/api/establishment_categories"

      expect(response).to have_http_status(:unauthorized)
    end

    it "forbids a guest" do
      get "/api/establishment_categories", headers: authorization_header(create_guest)

      expect(response).to have_http_status(:forbidden)
    end

    it "lists categories for an admin" do
      category = EstablishmentCategory.create!(name: "Food")

      get "/api/establishment_categories", headers: authorization_header(create_admin)

      expect(response).to have_http_status(:ok)
      expect(json_response.map { |row| row["id"] }).to contain_exactly(category.id)
    end
  end

  describe "POST /api/establishment_categories" do
    it "forbids a user who is not an admin" do
      post "/api/establishment_categories",
        params: { establishment_category: { name: "Food" } },
        headers: authorization_header(create_user),
        as: :json

      expect(response).to have_http_status(:forbidden)
    end

    it "creates a category for an admin" do
      post "/api/establishment_categories",
        params: { establishment_category: { name: "Food" } },
        headers: authorization_header(create_admin),
        as: :json

      expect(response).to have_http_status(:created)
      expect(json_response["name"]).to eq("Food")
      expect(EstablishmentCategory.find_by(name: "Food")).to be_present
    end
  end

  describe "PATCH /api/establishment_categories/:id" do
    it "updates a category for an admin" do
      category = EstablishmentCategory.create!(name: "Food")

      patch "/api/establishment_categories/#{category.id}",
        params: { establishment_category: { name: "Dining" } },
        headers: authorization_header(create_admin),
        as: :json

      expect(response).to have_http_status(:ok)
      expect(category.reload.name).to eq("Dining")
    end

    it "returns not found for a missing category" do
      patch "/api/establishment_categories/0",
        params: { establishment_category: { name: "Dining" } },
        headers: authorization_header(create_admin),
        as: :json

      expect(response).to have_http_status(:not_found)
    end
  end

  describe "DELETE /api/establishment_categories/:id" do
    it "deletes a category for an admin and clears the category on its establishments" do
      category = EstablishmentCategory.create!(name: "Food")
      property = create_property
      neighborhood = property.neighborhoods.create!(neighborhood_attributes)
      establishment = neighborhood.establishments.create!(establishment_attributes.merge(establishment_category: category))

      delete "/api/establishment_categories/#{category.id}", headers: authorization_header(create_admin)

      expect(response).to have_http_status(:ok)
      expect(json_response["message"]).to eq("Establishment category deleted successfully")
      expect(EstablishmentCategory.exists?(category.id)).to be(false)
      expect(establishment.reload.establishment_category).to be_nil
    end
  end
end
