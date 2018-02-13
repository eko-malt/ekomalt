class ShipmentsController < ApplicationController
  before_action :set_shipment, only: %i[show edit update destroy]

  def index
    @orders = Order.active
    @shipments = Shipment.all
    @shipment = Shipment.new
  end

  def new; end

  def create
    @shipment = Shipment.create(shipment_params)
    render :new unless @shipment.save
  end

  def show
    @shipment_item = Shipment.new
  end

  def edit; end

  def update
    render :edit unless @shipment.update(shipment_params)
    redirect_to shipment_path(@shipment)
  end

  def destroy
    @shipment.destroy
    redirect_to shipments_path
  end

  private

  def set_shipment
    @shipment = Shipment.find(params[:id])
  end

  def shipment_params
    params.require(:shipment).permit!
  end
end