class Shipment < ApplicationRecord
  validates :amount, numericality: { greather_than: 0 }

  has_many :bag_batches
end
