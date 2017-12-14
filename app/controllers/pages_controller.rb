class PagesController < ApplicationController
  def main
    @grain = GrainInput.all
    @bags = BagInput.all
    @settings = Setting.first
  end

  def storageraw
    @grain = GrainInput.remain
    @bags = BagInput.remain
  end
end
