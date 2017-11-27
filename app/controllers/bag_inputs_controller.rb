class BagInputsController < ApplicationController
  before_action :set_input, only: %i[show edit update destroy]

  def edit; end

  def show; end

  def create
    @bag_input = BagInput.new(input_params)
    render :new unless @bag_input.save
  end

  def destroy
    @bag_input.destroy
  end

  private

  def set_input
    @bag_input = BagInput.find(params[:id])
  end

  def input_params
    params.require(:bag_input).permit!
  end

end
