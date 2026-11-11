class User < ApplicationRecord
    has_secure_password
    has_many :sessions, as: :actor

    validates :email, presence: true
    validates :password_digest, presence: true
    validates :admin, inclusion: { in: [ true, false ] }, presence: true

    generates_token_for :refresh, expires_in: 30.days do
        email
    end
end
