class Order < ApplicationRecord
  include RailsSortable::Model

  validates :status, presence: true
  enum status: { active: 1, finished: 2 }
  set_sortable :sort

  belongs_to :client
  has_many :order_items, dependent: :destroy
  has_many :shipments
end
