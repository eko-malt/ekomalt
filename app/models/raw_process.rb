class RawProcess < ApplicationRecord
  validates :start_time, :finish_time, presence: true
  validate :valid_date_range

  belongs_to :equipment
  belongs_to :malt
  has_many :movements, as: :sourceable, dependent: :destroy
  has_many :movements, as: :targetable, dependent: :destroy

  enum status: { init: 0, process: 1, finished: 2, archived: 3, can_archive: 4 }

  scope :as_source, ->(maltose, eqtype) {
    joins(:equipment)
      .where('raw_processes.status = 2 AND equipment.eqtype = ? AND equipment.maltose = ?', eqtype, maltose)
      .includes(:movements)
  }

  scope :as_multi_source, ->(maltose, eqtype) {
    joins(:equipment)
        .where('raw_processes.status = 2 AND equipment.eqtype IN (?) AND equipment.maltose = ?', eqtype, maltose)
        .includes(:movements)
  }

  def check_and_update_status
    return if %w[can_archive archived].include?(status)
    output = Movement.where(sourceable: self).sum(:amount)
    input = self.movements.sum(:amount)
    self.amount = input - output
    if self.finished?
      self.can_archive! if input == output
    else
      if finish_time < Time.now
        self.finished!
      elsif start_time < Time.now
        self.process!
      end
    end
    save
  end

  def valid_date_range
    if (start_time && finish_time) && (finish_time < start_time)
      errors.add(:finish_time, I18n.t('process.errors.must_be_after_start'))
    end
  end
end