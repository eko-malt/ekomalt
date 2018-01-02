class Malt < ApplicationRecord
  validates :name, :color, presence: true
end
