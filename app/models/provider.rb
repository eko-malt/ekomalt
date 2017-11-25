class Provider < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :gtype, presence: true

  enum gtype: { grain: 1, bags: 2 }

  def gtypes
    [grain => 1, bags => 2]
  end
end
