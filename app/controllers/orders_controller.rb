class OrdersController < ApplicationController
  before_action :set_order, only: %i[show edit update destroy]

  def index
    @orders = Order.order(:deadline)
    @order = Order.new
  end

  def new; end

  def create
    @order = Order.create(order_params)
    render :new unless @order.save
  end

  def show
    @order_item = OrderItem.new
  end

  def edit; end

  def update
    render :edit unless @order.update(order_params)
    redirect_to order_path(@order)
  end

  def destroy
    @order.destroy
    redirect_to orders_path
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit!
  end
end
