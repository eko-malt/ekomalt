class MaltsController < ApplicationController
  before_action :set_malt, only: %i[show edit update destroy]

  def new
    @malt = Malt.new
  end

  def create
    @malt = Malt.create(malt_params)
    render :new unless @malt.save
    redirect_to settings_path
  end

  def show; end

  def edit; end

  def update
    render :edit unless @malt.update(malt_params)
  end

  def destroy
    @malt.destroy
    redirect_to malts_path
  end

  private

  def set_malt
    @malt = Malt.find(params[:id])
  end

  def malt_params
    params.require(:malt).permit!
  end
end
