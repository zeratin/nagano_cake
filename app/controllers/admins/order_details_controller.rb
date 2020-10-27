class Admins::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_detail.update(making_status_params)
    redirect_to admins_order_path(@order)
  end

  private
  def making_status_params
    params.require(:order_detail).permit(:making_status)
  end
end
