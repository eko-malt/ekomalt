class ProvidersController < ApplicationController
  before_action :set_provider, only: %i[show edit update destroy]

  def index
    @grain_providers = Provider.grain
    @bag_providers = Provider.bag
    @provider = Provider.new
  end

  def new; end

  def edit; end

  def show; end

  def create
    @provider = Provider.create(provider_params)
    # render :new unless @provider.save
  end

  def destroy
    @provider.destroy
    redirect_to providers_path
  end

  private

  def set_provider
    @provider = Provider.find(params[:id])
  end

  def provider_params
    params.require(:provider).permit!
  end
end
