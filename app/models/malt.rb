class Malt < ApplicationRecord
  validates :name, :color, presence: true
  has_many :malt_settings
end
