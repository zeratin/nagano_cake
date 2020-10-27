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
    @orders = Order.where(customer_id: current_customer.id)

  end

  def show
    @order = Order.find(params[:id])
    @sum = @order.total_payment - @order.shipping_cost
  end

  def confirm
    @order = Order.new

    @cart_items = current_customer.cart_items
    @order.payment_method = params[:order][:payment_method].to_i
    @order.address = params[:order][:address]
    @order.name = params[:order][:name]
    @order.postal_code = params[:order][:postal_code]
    @sum = 0
    @total_payment = 0
    current_customer.cart_items.each do |cart_item|
      @sum += (cart_item.item.price * 1.1).round * cart_item.amount
    end
    @total_payment = (@sum += 800).round
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
    @order.save
    @cart_items.each do |cart_item|
      order_detail = OrderDetail.new
      order_detail.making_status = 0
      order_detail.tax_included_price = (cart_item.item.price * 1.1).round
      order_detail.order_id = @order.id
      order_detail.amount = cart_item.amount
      order_detail.item_id = cart_item.item.id
      order_detail.save
    end
    @cart_items.destroy_all
    redirect_to orders_thanks_path
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
   params.require(:order).permit(:address, :payment_method, :name, :postal_code, :total_payment, :shipping_cost)
  end

end
