require "rails_helper"

RSpec.describe User, type: :model do
  subject { described_class.new(email: "ada@example.com", password: "secret123", password_confirmation: "secret123", admin: true) }

  it { is_expected.to have_many(:sessions) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:password_digest) }

  it "requires admin to be true" do
    user = described_class.new(email: "ada@example.com", password: "secret123", password_confirmation: "secret123")

    expect(user).not_to be_valid
    expect(user.errors[:admin]).to be_present

    user.admin = false
    expect(user).not_to be_valid

    user.admin = true
    expect(user).to be_valid
  end

  it "requires a password" do
    user = described_class.new(email: "ada@example.com", admin: true)

    expect(user).not_to be_valid
    expect(user.errors[:password]).to be_present
  end

  it "authenticates a matching password" do
    user = described_class.create!(email: "ada@example.com", password: "secret123", password_confirmation: "secret123", admin: true)

    expect(user.authenticate("secret123")).to eq(user)
    expect(user.authenticate("wrong")).to be(false)
  end

  it "issues a refresh token that stops working when the email changes" do
    user = described_class.create!(email: "ada@example.com", password: "secret123", password_confirmation: "secret123", admin: true)
    token = user.generate_token_for(:refresh)

    expect(described_class.find_by_token_for(:refresh, token)).to eq(user)

    user.update!(email: "ada.lovelace@example.com")

    expect(described_class.find_by_token_for(:refresh, token)).to be_nil
  end
end
