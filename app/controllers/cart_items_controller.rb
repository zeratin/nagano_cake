class CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items
  end


  def create
    @cart_items = CartItem.all
    @cart_item = CartItem.new(cart_item_params)
    # @cart_item = CartItem.new(cart_item_params)を@cart_item = CartItem.find(cart_item_params)に間違えるとエラー起きます
    @cart_item.customer_id = current_customer.id
    search_cart = @cart_items.where(customer_id: current_customer.id).where(item_id: @cart_item.item_id)

    if search_cart.empty?
      cart_item = CartItem.new(cart_item_params)
      cart_item.customer_id = current_customer.id
      cart_item.save
      redirect_to cart_items_path
    else
      binding.pry
      amount = search_cart[0].amount + @cart_item.amount
      @cart_item.update(amount: amount)
      redirect_to cart_items_path
    end


    # if @cart_item.blank?
    #
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