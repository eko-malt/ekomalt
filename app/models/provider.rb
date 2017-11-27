class Provider < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :gtype, presence: true

  has_many :grain_inputs
  has_many :bag_inputs

  enum gtype: { grain: 1, bag: 2 }
end
