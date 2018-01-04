class MaltSettingsController < ApplicationController
  before_action :set_malt, only: %i[edit update]

  def edit; end

  def update
    render :edit unless @malt.update(malt_settings_params)
  end

  private

  def set_malt
    @malt = MaltSetting.find(params[:id])
  end

  def malt_settings_params
    params.require(:malt_setting).permit!
  end

end
