class Client < ApplicationRecord
  validates :name, presence: true

  has_many :orders, dependent: :destroy
end
