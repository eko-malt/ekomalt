class OrderItem < ApplicationRecord
  validates :amount, :bag, presence: true

  belongs_to :order
  belongs_to :malt
end
