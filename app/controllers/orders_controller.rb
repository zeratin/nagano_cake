class OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @addresses = current_customer.addresses
    cart_items = current_customer.cart_items
    if cart_items.empty?
     redirect_to cart_items_path
    else
       @order = Order.new
    end
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def confirm
    @order = Order.new
    @cart_items = current_customer.cart_items
    @order.payment_method = params[:order][:payment_method].to_i
    @order.address = params[:order][:address]
    @order.name = params[:order][:name]
    @order.postal_code = params[:order][:postal_code]
    if params[:order][:address_option] == "1"
      @address = current_customer
    elsif params[:order][:address_option] == "2"
      @address = Address.find(params[:order][:address_id])
    elsif params[:order][:address_option] == "3"
      @address = Order.new(order_params)
    end
  end



  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @cart_items = current_customer.cart_items
    if @order.save


    redirect_to orders_thanks_path
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.customer_id = current_customer.id
    if @order.destroy
      redirect_to orders_path
    end
  end

  def thanks
  end

  private
  def order_params
   params.require(:order).permit(:address, :payment_method, :name, :postal_code)
  end
end
