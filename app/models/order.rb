class Order < ApplicationRecord
  validates :deadline, :status, presence: true
  enum status: { active: 1, finished: 2 }

  belongs_to :client
  has_many :order_items, dependent: :destroy
  has_many :shipments
end
