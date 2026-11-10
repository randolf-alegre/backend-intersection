require "rails_helper"

RSpec.describe Property, type: :model do
  subject { described_class.new(address: "1 Main Street", description: "A place to stay") }

  it { is_expected.to have_and_belong_to_many(:neighborhoods) }
  it { is_expected.to validate_presence_of(:address) }
  it { is_expected.to validate_presence_of(:description) }

  it "links a neighborhood through the join table and keeps that neighborhood when destroyed" do
    property = described_class.create!(address: "1 Main Street", description: "A place to stay")
    neighborhood = Neighborhood.create!(
      name: "Makati",
      hashtag: "#makati",
      description: "A neighborhood",
      hashtag_description: "City center",
      city: "Manila",
      tags: "food"
    )

    property.neighborhoods << neighborhood

    expect(property.neighborhoods).to contain_exactly(neighborhood)
    expect(neighborhood.properties).to contain_exactly(property)

    property.destroy

    expect(Neighborhood.exists?(neighborhood.id)).to be(true)
    expect(neighborhood.properties.reload).to be_empty
  end
end
