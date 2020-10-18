class CustomersController < ApplicationController

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update

  end

   private
  def customer_params
    params.require(:customer).permit(:first_name, :first_name_kana, :postal_code, :address, :phone_number, :email)
  end
end
