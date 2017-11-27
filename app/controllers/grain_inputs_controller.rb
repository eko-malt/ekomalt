class GrainInputsController < ApplicationController
  before_action :set_input, only: %i[show edit update destroy]

  def edit; end

  def show; end

  def create
    @grain_input = GrainInput.new(input_params)
    render :new unless @grain_input.save
  end

  def destroy
    @grain_input.destroy
  end

  private

  def set_input
    @grain_input = GrainInput.find(params[:id])
  end

  def input_params
    params.require(:grain_input).permit!
  end
end
