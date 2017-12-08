class BagInput < ApplicationRecord
  validates :date, :provider, :size, :amount, presence: true
  validates :amount, numericality: { only_integer: true }

  belongs_to :provider

  enum size: { kg50: 1, kg25: 2 }

end
