class GrainInput < ApplicationRecord
  validates :date, :provider, :weight_fact, :weight_doc, presence: true
  before_save :default_price

  belongs_to :provider

  def default_price
    self.price ||= 0
  end
end
