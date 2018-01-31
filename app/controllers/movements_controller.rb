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
    case @movement.sourceable_type
      when 'GrainInput'
        source = @movement.sourceable.weight_fact
        target = @movement.targetable.equipment.capacity - @movement.targetable.movements.sum(&:amount) + @movement.amount
      when 'RawProcess'
        source = @movement.sourceable.movements.sum(:amount)
        target = @movement.targetable.equipment.capacity - @movement.targetable.movements.sum(&:amount) + @movement.amount
      when 'GrainBatch'
        source = @movement.sourceable.amount + @movement.sourceable.correction
        target = 9999
      else
        source = 0
        target = 0
    end
    source = source - @movement.sourceable.movements.sum(&:amount) + @movement.amount
    @max = source > target ? target : source
  end

  def update
    @movement.update(movement_params)
    # TODO: redirect to targetable page
    if @movement.targetable == 'RawProcess'
      redirect_to raw_process_path(@movement.targetable_id)
    else
      redirect_to bag_batch_path(@movement.targetable_id)
    end
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
