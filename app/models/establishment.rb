class Establishment < ApplicationRecord
  belongs_to :establishment_category, optional: true
  has_and_belongs_to_many :neighborhoods, join_table: "neighborhood_establishment_tables"

  validates :name, presence: true
  validates :short, presence: true
  validates :long, presence: true
  validates :maps, presence: true, format: { with: URI.regexp }
  validates :cover_image, presence: true, format: { with: URI.regexp }
  validates :tags, presence: true, allow_blank: true
end
