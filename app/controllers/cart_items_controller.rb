class CartItemsController < ApplicationController


  def index
    # @cart_items = current_cart.cart_items
    @cart_items = CartItem.all
  end


  def create
    
    @item_customer = current_customer
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_item.item_id = params[:cart_item][:item_id]
    if @cart_item.save
      redirect_to cart_items_path
    end
    # if @cart_item.blank?
    #   # @cart_item.saveにするとNoMethodErrorが起きる
    #   redirect_to cart_items_path
    # end
  end


  private
  def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id, :customer_id)
  end
end
