class Neighborhood < ApplicationRecord
  has_and_belongs_to_many :properties, join_table: "property_neighborhoods"
  has_and_belongs_to_many :establishments, join_table: "neighborhood_establishment_tables"

  validates :name, presence: true
  validates :hashtag, presence: true
  validates :description, presence: true
  validates :hashtag_description, presence: true
  validates :city, presence: true
  validates :tags, presence: true
end
