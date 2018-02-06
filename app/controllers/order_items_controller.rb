class OrderItemsController < ApplicationController
  before_action :set_order_item, only: %i[edit update destroy]

  def new
    @order_item = OrderItem.new(order_id: params[:order])
  end

  def create
    @order_item = OrderItem.create(order_item_params)
    render :new unless @order_item.save
    redirect_to order_path(@order_item.order_id)
  end

  def edit; end

  def update
    render :edit unless @order_item.update(order_item_params)
    redirect_to order_path(@order_item.order)
  end

  def destroy
    order = @order_item.order
    @order_item.destroy
    redirect_to order_path(order)
  end

  private

  def set_order_item
    @order_item = OrderItem.find(params[:id])
  end

  def order_item_params
    params.require(:order_item).permit!
  end
end
