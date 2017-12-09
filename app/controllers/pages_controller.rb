class PagesController < ApplicationController

  def main
    @grain = GrainInput.all
    @bags = BagInput.all
  end

end