class BagInput < ApplicationRecord
  validates :date, :provider, :size, :amount, presence: true
  validates :amount, numericality: { only_integer: true, greater_than: 0 }

  belongs_to :provider

  enum size: { kg50: 1, kg25: 2 }

  scope :group_by_month, -> { group("date_trunc('month', date)") }
end
