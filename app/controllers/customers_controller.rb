class CustomersController < ApplicationController

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
     @customer = Customer.find(params[:id])
     if @customer.update(customer_params)
       redirect_to customer_path(current_customer),  notice: "You have updated user successfully."
     end
  end

   private
  def customer_params
    params.permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :phone_number, :email)
  end
end
