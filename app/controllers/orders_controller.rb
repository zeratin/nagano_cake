class OrdersController < ApplicationController
  def new
  end

  private
  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :phone_number, :email)
  end
end
