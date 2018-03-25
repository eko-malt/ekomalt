class GrainInputsController < ApplicationController
  before_action :set_input, only: %i[show edit edit_quality update destroy]

  def new
    @grain_input = GrainInput.new(input_params)
  end

  def create
    @grain_input = GrainInput.new(input_params)
    render :new unless @grain_input.save
  end

  def show; end

  def edit; end

  def edit_quality; end

  def update
    render :edit unless @grain_input.update(input_params)
    redirect_to inputs_path
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
