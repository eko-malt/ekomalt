class BagBatch < ApplicationRecord
  belongs_to :malt
  has_many :movements, as: :sourceable, dependent: :destroy
  has_many :movements, as: :targetable, dependent: :destroy
end
