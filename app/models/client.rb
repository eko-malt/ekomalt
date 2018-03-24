class Client < ApplicationRecord
  validates :name, presence: true

  has_many :orders, dependent: :destroy
  has_many :shipments
end
