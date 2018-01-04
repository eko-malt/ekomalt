class SettingsController < ApplicationController
  def index
    @settings = Setting.first
    @equipments = Equipment.order(:maltose, :created_at)
    @malts = Malt.all
    @malt_settings = MaltSetting.with_equipments
    @malt_sett_by_malt = @malt_settings.group_by(&:malt_id)
    @malt_s_grouped = @malt_sett_by_malt.map { |m, set| set.group_by{ |s| s.equipment.maltose } }
  end

  def update
    @settings = Setting.first
    render :index unless @settings.update(settings_params)
  end

  def settings_params
    params.require(:setting).permit!
  end
end
