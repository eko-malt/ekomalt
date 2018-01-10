class RawProcess < ApplicationRecord
  validates :start_time, :finish_time, presence: true

  belongs_to :equipment
  has_many :movements, as: :sourceable
  has_many :movements, as: :targetable

  enum status: { init: 0, process: 1, finished: 2, archived: 3 }

  def check_time_and_statuses
    return unless status != 'archived'
    if finish_time < Time.now
      self.status = 'finished'
    elsif start_time < Time.now
      self.status = 'process'
    end
    save
  end

end