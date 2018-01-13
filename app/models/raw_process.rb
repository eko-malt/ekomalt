class RawProcess < ApplicationRecord
  validates :start_time, :finish_time, presence: true
  validate :valid_date_range_required

  belongs_to :equipment
  has_many :movements, as: :sourceable, dependent: :destroy
  has_many :movements, as: :targetable, dependent: :destroy

  enum status: { init: 0, process: 1, finished: 2, archived: 3 }

  def check_time_and_statuses
    return if %w[archived finished].include?(status)
    if finish_time < Time.now
      self.status = 'finished'
    elsif start_time < Time.now
      self.status = 'process'
    end
    save
  end

  def valid_date_range_required
    if (start_time && finish_time) && (finish_time < start_time)
      errors.add(:finish_time, I18n.t('process.errors.must_be_after_start'))
    end
  end
end