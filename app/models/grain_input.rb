class GrainInput < ApplicationRecord
  validates :date, :provider, :weight_fact, :weight_doc, presence: true
  before_save :default_price
  before_create :set_remainders

  belongs_to :provider

  scope :remain, -> () { where('remainder > 0') }

  def default_price
    self.price ||= 0
  end

  def set_remainders
    self.remainder = weight_fact
  end
end
