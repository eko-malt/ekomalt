class BagBatch < ApplicationRecord
  belongs_to :malt
  has_many :shipments
  has_many :movements, as: :sourceable, dependent: :destroy
  has_many :movements, as: :targetable, dependent: :destroy

  scope :by_malt, ->(malt) { where('malt_id = ?', malt) }
end
