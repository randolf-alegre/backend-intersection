class Property < ApplicationRecord
  has_and_belongs_to_many :neighborhoods, join_table: "property_neighborhoods"

  validates :address, presence: true
  validates :description, presence: true
end
