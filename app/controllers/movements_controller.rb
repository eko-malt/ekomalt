class MovementsController < ApplicationController
  before_action :set_movement, only: %i[edit update destroy]

  def create
    @movement = Movement.create(movement_params)
    if @movement.targetable_type == 'RawProcess'
      redirect_to raw_process_path(@movement.targetable_id) if @movement.save
    else
      redirect_to bag_batch_path(@movement.targetable_id) if @movement.save
    end
  end

  def edit
    @inputs = GrainInput.at_storage
  end

  def update
    @movement.update(movement_params)
    redirect_to raw_process_path(@movement.targetable_id)
  end

  def destroy
    target = @movement.targetable_type
    @movement.destroy
    if target == 'RawProcess'
      redirect_to raw_process_path(@movement.targetable_id)
    else
      redirect_to bag_batch_path(@movement.targetable_id)
    end
  end

  private

  def set_movement
    @movement = Movement.find(params[:id])
  end

  def movement_params
    params.require(:movement).permit!
  end
end
