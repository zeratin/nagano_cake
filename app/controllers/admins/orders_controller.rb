class Admins::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @orders = Order.all
  end

  def show
    # @orders = Order.all
    @order = Order.find(params[:id])
    # binding.pry
    @order_details
  end

  def status_update
    @order = Order.find(params[:id])
    @order.update(order_status_params)
    redirect_to admins_order_path(@order)
  end

  private
  def order_status_params
    params.require(:order).permit(:status)
  end
end
