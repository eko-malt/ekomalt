class ProviderController < ApplicationController
  before_action :set_provider, only: [:edit, :update, :destroy]

  def index
    @providers = Provider.all
    @provider = Provider.new
  end

  def new; end

  def edit; end

  private

  def set_provider
    @provider = Provider.find(params[:id])
  end
end
