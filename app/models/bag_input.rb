class BagInput < ApplicationRecord
  validates :date, :provider, :size, :amount, presence: true
  validates :amount, numericality: { only_integer: true }
  validate :date_must_be_in_the_past

  enum size: { kg50: 1, kg25: 2 }

  belongs_to :provider

  def date_must_be_in_the_past
    errors.add(:date, I18n.t('errors.messages.past_date')) if (date.present? && date > Date.today)
  end
end
