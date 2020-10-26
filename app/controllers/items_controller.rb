class ItemsController < ApplicationController

def index
  @genres = Genre.where(is_active: true)
  @genre = @genres.find_by(id: params[:search])
  unless @genre.nil?
    @items = Item.where(genre_id: @genre.id)
  else
    @items = Item.all
  end
end


def show
  @genres = Genre.where(is_active: true)
  @item = Item.new
  @item = Item.find(params[:id])
  @tax_included_price = @item.price * 1.1
  @cart_item = CartItem.new
end


end
