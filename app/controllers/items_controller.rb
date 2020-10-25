class ItemsController < ApplicationController

def index
  @genres = Genre.all
  @genre = @genres.find_by(id: params[:search])
  unless @genre.nil?
    @items = Item.where(genre_id: @genre.id)
  else
    @items = Item.all
  end
  # @genre = params["search"]["genre"]
  # if @genre == 1.to_s
  #   @items = Item.where(genre: "1.to_s")
  # elsif @genre == 2.to_s
  #   @items = Item.where(genre: "2.to_s")
  # end
end


def show
  @genres = Genre.all
  @item = Item.new
  @item = Item.find(params[:id])
  @tax_included_price = @item.price * 1.1
  @cart_item = CartItem.new
end


end
