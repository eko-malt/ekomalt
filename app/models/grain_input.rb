class GrainInput < ApplicationRecord
  validates :date, :provider, :weight_fact, :weight_doc, presence: true

  belongs_to :provider
end
