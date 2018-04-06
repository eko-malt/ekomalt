class Equipment < ApplicationRecord
  validates :eqtype, :name, :maltose, :capacity, :service_time, :status, presence: true
  after_save :create_malt_settings

  enum eqtype: { vat: 1, thresh: 2, fermenter: 3, druing: 4 }
  enum maltose: { oldm: 1, newm: 2 }
  enum status: { broken: 0, working: 1 }

  has_many :raw_processes, dependent: :destroy
  has_many :movements, through: :raw_processes
  has_many :malt_settings, dependent: :destroy

  scope :in_production, -> { left_joins(:movements).group(:id).where.not('raw_processes.status = 3').sum(:amount) }
  scope :with_movements, ->(maltose, eqtype) { left_joins(:raw_processes).where('maltose = ? AND eqtype = ? AND raw_processes.status = ?', maltose, eqtype, 2).includes(:movements) }

  private

  def create_malt_settings
    Malt.all.each do |m|
      MaltSetting.create(malt: m, equipment: self, duration: 1, available: 1)
    end
  end
end