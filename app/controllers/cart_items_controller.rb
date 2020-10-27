class CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items
  end


  def create
    @cart_item = CartItem.new(cart_item_params)
    # @cart_item = CartItem.new(cart_item_params)を@cart_item = CartItem.find(cart_item_params)に間違えるとエラー起きます
    @cart_item.customer_id = current_customer.id
    @cart_item.save
    redirect_to cart_items_path

    # if @cart_item.blank?
    #   # @cart_item.saveにするとNoMethodErrorが起きる
    #   redirect_to cart_items_path
    # end
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.customer_id = current_customer.id
    cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    if @cart_item.destroy
      redirect_to cart_items_path
    end
  end

  def destroy_all
    cart_items = current_customer.cart_items
    cart_items.delete_all
    redirect_to cart_items_path
  end


  private
  def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id)
  end
end