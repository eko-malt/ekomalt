class BagBatchesController < ApplicationController
  before_action :set_batch, only: %i[show edit update destroy]

  def new
    @batch = BagBatch.new
  end

  def create
    @batch = BagBatch.new(batch_params)
    redirect_to bag_batch_path(@batch) if @batch.save
  end

  def show
    @sources = GrainBatch.at_storage + GrainBatch.full_at_storage
    @movement = Movement.new
  end

  def edit; end

  def update
    render :edit unless @batch.update(batch_params)
    redirect_to bag_batch_path(@batch)
  end

  def destroy
    @batch.destroy
    redirect_to storage_malt_path
  end

  private

  def set_batch
    @batch = BagBatch.find(params[:id])
  end

  def batch_params
    params.require(:bag_batch).permit!
  end

end
