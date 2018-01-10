class PagesController < ApplicationController
  def main
    @at_storage = GrainInput.all.sum(:weight_fact) - Movement.by_source_type('GrainInput').sum(:amount)
    @bags = BagInput.all
    @settings = Setting.first
  end

  def storageraw
    @grain = GrainInput.at_storage + GrainInput.full_at_storage
    @grain.sort_by(&:date)
    @bags = BagInput.all
  end

  def oldmaltose
    @equipment = Equipment.oldm.order(:eqtype, :name).includes(raw_processes: :movements)
    @equipment.each do |eq|
      eq.raw_processes.each &:check_time_and_statuses
    end
  end

end
