class Malt < ApplicationRecord
  validates :name, :color, presence: true
  has_many :malt_settings

  scope :by_equipment, ->(equipment) { joins(:malt_settings).where('malt_settings.equipment_id = ?', equipment) }
end