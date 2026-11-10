require "rails_helper"

RSpec.describe Guest, type: :model do
  it { is_expected.to have_many(:sessions) }

  it "requires a keycard token" do
    expect { described_class.create! }.to raise_error(ActiveRecord::NotNullViolation)
  end

  it "issues a refresh token that stops working when the keycard token changes" do
    guest = described_class.create!(keycard_token: "card-abc")
    token = guest.generate_token_for(:refresh)

    expect(described_class.find_by_token_for(:refresh, token)).to eq(guest)

    guest.update!(keycard_token: "card-xyz")

    expect(described_class.find_by_token_for(:refresh, token)).to be_nil
  end
end
