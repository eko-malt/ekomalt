class GrainBatch < ApplicationRecord
  belongs_to :raw_process
  belongs_to :malt

  has_many :movements, as: :sourceable

  scope :at_storage, -> {
    joins(:movements)
        .group('grain_batches.id')
        .having('sum(movements.amount) < grain_batches.amount')
  }
  scope :full_at_storage, -> { left_outer_joins(:movements).where(movements: { sourceable_id: nil }) }

end
