class OrderItem < ApplicationRecord
  validates :amount, :bag, presence: true

  belongs_to :order
  belongs_to :malt
  has_many :shipments, dependent: :destroy
end