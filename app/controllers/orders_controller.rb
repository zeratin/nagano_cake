class OrdersController < ApplicationController
  def new
  end
  
  def index 
  end 
  
  def show
  end 

  def confirm
     @cart_items = current_customer.cart_items
     
  end

  def thanks
  end

  private
  def order_params
  end
end
