class ShipmentsController < ApplicationController
  before_action :set_shipment, only: %i[show edit update destroy]

  def index
    @shipments = Shipment.all.order(:date).group_by { |x| [x.date, x.order_item.order_id] }
  end

  def new
    @shipment = Shipment.new(order_item_id: params[:order_item], date: Date.today)
    @bag_batches = BagBatch.by_malt(OrderItem.find(params[:order_item]).malt)
  end

  def create
    @shipment = Shipment.create(shipment_params)
    render :new unless @shipment.save
  end

  def show
    #request.env['HTTP_REFERER'].include?('order') ? (redirect_back fallback_location: orders_path) : (redirect_to shipment_path)
  end

  def edit
    @bag_batches = BagBatch.by_malt(@shipment.order_item.malt_id)
  end

  def update
    render :edit unless @shipment.update(shipment_params)
    redirect_back fallback_location: orders_path
  end

  def destroy
    @shipment.destroy
    request.env['HTTP_REFERER'].include?('order') ? (redirect_back fallback_location: orders_path) : (redirect_to shipments_path)
  end

  private

  def set_shipment
    @shipment = Shipment.find(params[:id])
  end

  def shipment_params
    params.require(:shipment).permit!
  end
end