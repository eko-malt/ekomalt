class Shipment < ApplicationRecord
  validates :date, :client_id, presence: true

  belongs_to :client
end
