class BagInput < ApplicationRecord
  validates :date, :provider, :size, :amount, presence: true
  validates :amount, numericality: { only_integer: true }
  before_create :set_remainders

  enum size: { kg50: 1, kg25: 2 }

  belongs_to :provider

  scope :remain, -> () { where('remainder > 0') }

  private

  def set_remainders
    self.remainder = self.amount
  end

end
