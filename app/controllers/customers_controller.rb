class CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end


  def update
     @customer = Customer.find(params[:id])
     if @customer.update(customer_params)
       redirect_to customer_path(current_customer)
     else
       render 'edit'
     end
  end

  def unsubscribe
  end

  def withdraw
    sign_out_and_redirect(current_customer)
  end

   private
  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :phone_number, :email)
  end

end
