class ProvidersController < ApplicationController
  before_action :set_provider, only: %i[show edit update destroy]

  def index
    @providers_grain = Provider.grain
    @providers_bags = Provider.bags
    @provider = Provider.new
  end

  def new; end

  def edit; end

  def show; end

  def create
    @provider = Provider.new(provider_params)
    render :new unless @provider.save
  end

  private

  def set_provider
    @provider = Provider.find(params[:id])
  end

  def provider_params
    params.require(:provider).permit!
  end
end
