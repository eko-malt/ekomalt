class Equipment < ApplicationRecord
  validates :eqtype, :name, :maltose, :capacity, :service_time, :status, presence: true

  enum eqtype: { vat: 1, thresh: 2, fermenter: 3, druing: 4 }
  enum maltose: { oldm: 1, newm: 2 }
  enum status: { broken: 0, working: 1 }

  has_many :raw_processes, dependent: :destroy
  has_many :movements, through: :raw_processes

  scope :in_process, ->() { includes(:raw_processes).where('equipment.raw_process.status = 3') }
  scope :with_movements, ->(maltose, eqtype) { left_joins(:raw_processes).where('maltose = ? AND eqtype = ? AND raw_processes.status = ?', maltose, eqtype, 2).includes(:movements) }
  scope :in_production, -> { left_joins(:movements).group(:id).where.not('raw_processes.status = 3').sum(:amount) }

end