class Equipment < ApplicationRecord
  validates :eqtype, :name, :maltose, :capacity, :service_time, :status, presence: true

  enum eqtype: { vat: 1, thresh: 2, fermenter: 3, druing: 4 }
  enum maltose: { oldm: 1, newm: 2 }
  enum status: { broken: 0, working: 1 }

  has_many :raw_processes
end
