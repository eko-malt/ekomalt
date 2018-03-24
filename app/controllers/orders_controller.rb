class OrdersController < ApplicationController
  before_action :set_order, only: %i[show edit update status_update destroy]

  def index
    @orders_active = Order.active.order(:deadline)
    @orders_finished = Order.finished.order(:deadline)
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

  def status_update
    @order.update(status: params[:status])
    redirect_to order_path(@order)
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit!
  end
end
