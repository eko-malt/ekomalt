class RawProcess < ApplicationRecord
  belongs_to :equipment
  has_many :movements, as: :sourceable
  has_many :movements, as: :targetable

  enum status: { init: 0, process1: 1, process2: 2, finished: 3, archived: 4 }
end
