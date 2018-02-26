class Malt < ApplicationRecord
  validates :name, :color, :koef, presence: true
  validates :koef, numericality: { greather_than: 0 }
  has_many :malt_settings

  scope :by_equipment, ->(equipment) { joins(:malt_settings).where('malt_settings.equipment_id = ?', equipment) }
end