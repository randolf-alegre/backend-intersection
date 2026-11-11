class EstablishmentCategory < ApplicationRecord
    has_many :establishments, dependent: :nullify

    validates :name, presence: true, uniqueness: true
end
