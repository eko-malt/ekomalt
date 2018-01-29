class PagesController < ApplicationController
  def main
    @at_storage = GrainInput.all.sum(:weight_fact) - Movement.by_source_type('GrainInput').sum(:amount)
    @bags = BagInput.all
    @settings = Setting.first
    @in_production = Equipment.in_production.values.sum
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

  def newmaltose
    @equipment = Equipment.newm.order(:eqtype, :name).includes(raw_processes: :movements)
    @equipment.each do |eq|
      eq.raw_processes.each &:check_time_and_statuses
    end
  end

  def storagemalt
    @batch = BagBatch.new
    @grain_batches = GrainBatch.order(:created_at).group_by { |m| m.name[2..3] }
    @bag_batches = BagBatch.order(:batch).group_by { |m| m.shredded.beginning_of_month }
  end
end
