class Session < ApplicationRecord
  belongs_to :actor, polymorphic: true

  validates :actor_type, presence: true
  validates :actor_id, presence: true
end
