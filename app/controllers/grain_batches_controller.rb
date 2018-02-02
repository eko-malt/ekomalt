class GrainBatchesController < ApplicationController
  before_action :set_batch, only: %i[edit update destroy]

  def new
    process = RawProcess.find(params[:raw_process])
    process.finish_time.hour < 8 || process.finish_time.hour > 20 ? change = '2' : change = '1'
    name = "#{process.finish_time.strftime('%d')}#{process.finish_time.strftime('%m')}#{change}#{process.equipment.maltose == 'oldm' ? t('batch.maltose.oldm') : t('batch.maltose.newm')}"
    @batch = GrainBatch.new(name: name, amount: process.movements.sum(:amount), raw_process: process, malt: process.malt)
  end

  def create
    @batch = GrainBatch.new(batch_params)
    render :new unless @batch.save
    # TODO: move this to model
    @batch.raw_process.archived!
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
