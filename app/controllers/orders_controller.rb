class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
  end

  def edit
  end

  def update
    @order = Order.find(params[:id])
    order_params[:customer] = Customer.find(order_params[:customer])
    @order.update(order_params)

    redirect_to orders_path
  end

  def create
    order_params[:customer] = Customer.find(order_params[:customer])
    @order = Order.create(order_params)
  end

  def order_params
    params.require(:order).permit!
  end
end
