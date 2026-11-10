require "rails_helper"

RSpec.describe EstablishmentCategory, type: :model do
  subject { described_class.new(name: "Food") }

  it { is_expected.to have_many(:establishments).dependent(:nullify) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name) }

  it "keeps establishments and clears their category when destroyed" do
    category = described_class.create!(name: "Food")
    establishment = Establishment.create!(
      name: "Cafe",
      short: "Coffee",
      long: "A small cafe",
      maps: "https://maps.example.com/cafe",
      cover_image: "https://cdn.example.com/cover.jpg",
      tags: "coffee",
      establishment_category: category
    )

    category.destroy

    expect(Establishment.exists?(establishment.id)).to be(true)
    expect(establishment.reload.establishment_category).to be_nil
  end
end
