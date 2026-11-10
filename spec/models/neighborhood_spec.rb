require "rails_helper"

RSpec.describe Neighborhood, type: :model do
  subject do
    described_class.new(
      name: "Makati",
      hashtag: "#makati",
      description: "A neighborhood",
      hashtag_description: "City center",
      city: "Manila",
      tags: "food"
    )
  end

  it { is_expected.to have_and_belong_to_many(:properties) }
  it { is_expected.to have_and_belong_to_many(:establishments) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:hashtag) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:hashtag_description) }
  it { is_expected.to validate_presence_of(:city) }
  it { is_expected.to validate_presence_of(:tags) }

  it "links an establishment through the join table" do
    neighborhood = subject
    neighborhood.save!
    establishment = Establishment.create!(
      name: "Cafe",
      short: "Coffee",
      long: "A small cafe",
      maps: "https://maps.example.com/cafe",
      cover_image: "https://cdn.example.com/cover.jpg",
      tags: "coffee"
    )

    neighborhood.establishments << establishment

    expect(neighborhood.establishments).to contain_exactly(establishment)
    expect(establishment.neighborhoods).to contain_exactly(neighborhood)
  end
end
