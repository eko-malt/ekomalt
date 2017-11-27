class InputsController < ApplicationController

  def index
    @grain_inputs = GrainInput.order(:date)
    @bag_inputs = BagInput.order(:date)
    @grain_input = GrainInput.new
    @bag_input = BagInput.new
  end

end
