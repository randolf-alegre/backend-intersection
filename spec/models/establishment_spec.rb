require "rails_helper"

RSpec.describe Establishment, type: :model do
  subject do
    described_class.new(
      name: "Cafe",
      short: "Coffee",
      long: "A small cafe",
      maps: "https://maps.example.com/cafe",
      cover_image: "https://cdn.example.com/cover.jpg",
      tags: "coffee"
    )
  end

  it { is_expected.to belong_to(:establishment_category).optional }
  it { is_expected.to have_and_belong_to_many(:neighborhoods) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:short) }
  it { is_expected.to validate_presence_of(:long) }
  it { is_expected.to validate_presence_of(:maps) }
  it { is_expected.to validate_presence_of(:cover_image) }
  it { is_expected.to allow_value("https://maps.example.com/cafe").for(:maps) }
  it { is_expected.not_to allow_value("not a url").for(:maps) }
  it { is_expected.to allow_value("https://cdn.example.com/cover.jpg").for(:cover_image) }
  it { is_expected.not_to allow_value("not a url").for(:cover_image) }

  it "allows a blank tags value" do
    subject.tags = ""

    expect(subject).to be_valid
  end

  it "can be saved without a category" do
    expect(subject).to be_valid
    expect(subject.establishment_category).to be_nil
  end
end
