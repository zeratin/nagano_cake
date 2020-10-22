class ItemsController < ApplicationController

def index
  @items = Item.all
  @item = Item.new
end


def show
  @item = Item.find(params[:id])
  @tax_included_price = @item.price * 1.1
  @cart_item = CartItem.new
end


end
