class SettingsController < ApplicationController
  def index
    @settings = Setting.first
    @malts = Malt.all
    @equipments = Equipment.order(:maltose)
  end

  def update
    @settings = Setting.first
    render :index unless @settings.update(settings_params)
  end

  def settings_params
    params.require(:setting).permit!
  end
end
