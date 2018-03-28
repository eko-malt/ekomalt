class Shipment < ApplicationRecord
  validates :date, :amount, presence: true

  belongs_to :order_item
  belongs_to :bag_batch
end
