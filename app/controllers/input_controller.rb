class InputController < ApplicationController
  before_action :set_input, only: %i[edit update destroy]

  def index
    @inputs = Input.all
    @input = Input.new
  end

  def new; end

  def edit; end

  private

  def set_input
    @input = Inputs.find(params[:id])
  end
end
