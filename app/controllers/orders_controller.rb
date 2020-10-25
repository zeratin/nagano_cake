class OrdersController < ApplicationController
  def new
  end
  
  def confirm
     @cart_items = current_customer.cart_items
  end
end
