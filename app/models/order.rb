class Order < ApplicationRecord
  validates :deadline, presence: true

  belongs_to :client
  has_many :order_items, dependent: :destroy
end
