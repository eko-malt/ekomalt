class MaltSetting < ApplicationRecord
  validates :duration, :available, numericality: { greather_than: 0 }

  belongs_to :malt
  belongs_to :equipment

  scope :with_equipments, -> { joins(:equipment).order(:malt_id, :equipment_id) }
end
