class Equipment < ApplicationRecord
  validates :eqtype, :name, :maltose, :capacity, :service_time, :status, presence: true

  enum eqtype: { vat: 1, thresh: 2, fermenter: 3, druing: 4 }
  enum maltose: { oldm: 1, newm: 2 }
  enum status: { broken: 0, empty: 1, filled: 2, finished: 3, service: 4, process1: 5, process2: 6 }
end
