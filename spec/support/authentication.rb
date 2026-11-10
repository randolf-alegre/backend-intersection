module AuthenticationHelper
  def json_response
    response.parsed_body
  end

  def authorization_header(actor)
    { "Authorization" => "Bearer #{JWTAuthentication.generate_token(actor)}" }
  end

  def create_admin(email: "admin@example.com")
    User.create!(
      email: email,
      password: "secret123",
      password_confirmation: "secret123",
      admin: true
    )
  end

  def create_guest(keycard_token: "card-abc")
    Guest.create!(keycard_token: keycard_token)
  end

  def create_user(email: "member@example.com")
    user = create_admin(email: email)
    user.update_column(:admin, false)
    user
  end

  def create_property(name: "Inn")
    Property.create!(name: name, address: "1 Main Street", description: "A place to stay")
  end

  def neighborhood_attributes(name: "Makati")
    {
      name: name,
      hashtag: "#makati",
      description: "A neighborhood",
      hashtag_description: "City center",
      city: "Manila",
      tags: "food"
    }
  end

  def establishment_attributes(name: "Cafe")
    {
      name: name,
      short: "Coffee",
      long: "A small cafe",
      maps: "https://maps.example.com/cafe",
      cover_image: "https://cdn.example.com/cover.jpg",
      tags: "coffee"
    }
  end
end

RSpec.configure do |config|
  config.include AuthenticationHelper, type: :request
end
