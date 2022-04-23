class OrdersController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    order_params[:customer] = Customer.find(order_params[:customer])
    @order = Order.create(order_params)
  end

  def order_params
    params.require(:order).permit!
  end
end
