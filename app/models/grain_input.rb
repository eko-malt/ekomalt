class GrainInput < ApplicationRecord
  validates :date, :provider, :weight_fact, :weight_doc, presence: true
  validate :date_must_be_in_the_past

  before_save :default_price

  has_many :movements, as: :sourceable
  belongs_to :provider

  def default_price
    self.price ||= 0
  end

  scope :at_storage, -> {
      joins(:movements)
      .group('grain_inputs.id')
      .having('sum(movements.amount) < grain_inputs.weight_fact')
  }
  scope :full_at_storage, -> { left_outer_joins(:movements).where(movements: { sourceable_id: nil }) }

  def date_must_be_in_the_past
    errors.add(:date, I18n.t('errors.messages.past_date')) if (date.present? && date > Date.today)
  end
end
