require "rails_helper"

RSpec.describe Session, type: :model do
  it { is_expected.to belong_to(:actor) }

  it "requires an actor" do
    expect(described_class.new).not_to be_valid
  end

  it "belongs to a guest" do
    guest = Guest.create!(keycard_token: "card-abc")
    session = described_class.create!(actor: guest)

    expect(session.actor).to eq(guest)
    expect(guest.sessions).to contain_exactly(session)
  end

  it "belongs to a user" do
    user = User.create!(email: "ada@example.com", password: "secret123", password_confirmation: "secret123", admin: true)
    session = described_class.create!(actor: user)

    expect(session.actor).to eq(user)
    expect(user.sessions).to contain_exactly(session)
  end
end
