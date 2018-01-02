class Movement < ApplicationRecord
  validates :amount, numericality: { greather_than: 0 }
  validates :targetable_id, :targetable_type, :sourceable_id, :sourceable_type, presence: true

  belongs_to :sourceable, polymorphic: true
  belongs_to :targetable, polymorphic: true

  scope :by_source, ->(source) { where('sourceable_id = ?', source) }
  scope :by_source_type, ->(type) { where('sourceable_type = ?', type) }
  scope :by_target, ->(target) { where('targetable_id = ?', target) }
  scope :by_target_type, ->(type) { where('targetable_type = ?', type) }
end
