class InputsController < ApplicationController

  def index
    @grain_inputs = GrainInput.all.order(:date).group_by { |m| m.date.beginning_of_month }
    @bag_inputs = BagInput.all.order(:date).group_by { |m| m.date.beginning_of_month }
    @grain_input = GrainInput.new
    @bag_input = BagInput.new
  end

end