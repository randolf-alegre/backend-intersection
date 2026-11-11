class Guest < ApplicationRecord
    has_many :sessions, as: :actor

    generates_token_for :refresh, expires_in: 30.days do
        keycard_token
    end
end
