class EquipmentController < ApplicationController
  before_action :set_equipment, only: %i[edit update]

  def edit; end

  def update
    render :edit unless @equipment.update(equipment_params)
  end

  private

  def set_equipment
    @equipment = Equipment.find(params[:id])
  end

  def equipment_params
    params.require(:equipment).permit!
  end
end
