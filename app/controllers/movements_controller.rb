class MovementsController < ApplicationController
  before_action :set_movement, only: %i[edit update destroy]

  def create
    @movement = Movement.new(movement_params)
    render :new unless @movement.save
    redirect_to raw_process_path(@movement.targetable_id)
  end

  def edit
    @inputs = GrainInput.at_storage
  end

  def update
    @movement.update(movement_params)
    redirect_to raw_process_path(@movement.targetable_id)
  end

  def destroy
    @movement.destroy
    redirect_to raw_process_path(@movement.targetable_id)
  end

  private

  def set_movement
    @movement = Movement.find(params[:id])
  end

  def movement_params
    params.require(:movement).permit!
  end
end
