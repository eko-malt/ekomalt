class GrainToSoak < ApplicationRecord
  belongs_to :grain_input
  belongs_to :soak
end