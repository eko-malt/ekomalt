class GrainBatchesController < ApplicationController
  before_action :set_batch, only: %i[edit update destroy]

  def new
    @process = RawProcess.find(params[:raw_process])
    @process.finish_time.hour < 8 || @process.finish_time.hour > 20 ? change = '2' : change = '1'
    name = "#{@process.finish_time.strftime('%d')}#{@process.finish_time.strftime('%m')}-#{change}#{@process.equipment.maltose == 'oldm' ? t('batch.maltose.oldm') : t('batch.maltose.newm')}"
    @amount = @process.movements.sum(:amount)
    @batch = GrainBatch.new(name: name, amount: (@amount / @process.malt.koef).round(3), raw_process: @process, malt: @process.malt)
    @other_druing = RawProcess.where(equipment_id: Equipment.druing.oldm.where.not(id: @process.equipment_id)).finished.first
    @other_druing_amount = @other_druing.movements.sum(:amount)
  end

  def create
    @batch = GrainBatch.new(batch_params)
    @batch.amount += params[:other_druing].to_d if params[:other_druing_adding] == '1'
    render :new unless @batch.save
    # TODO: move this to model
    @batch.raw_process.archived!
    RawProcess.where(equipment_id: Equipment.druing.oldm.where.not(id: @batch.raw_process.equipment_id)).finished.first.archived!
    redirect_to storage_malt_path
  end

  def edit; end

  def update
    render :edit unless @batch.update(batch_params)
    redirect_to storage_malt_path
  end

  def destroy
    @batch.destroy
    redirect_to storage_malt_path
  end

  private

  def set_batch
    @batch = GrainBatch.find(params[:id])
  end

  def batch_params
    params.require(:grain_batch).permit!
  end

end
