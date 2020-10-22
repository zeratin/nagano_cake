class ItemsController < ApplicationController

def index
  @items = Item.all
  @genres = Genre.all
  # if params[:genre_id]
  #   @genre = Genre.find(params[:genre_id])
  #   @items = @genre.items
  # else
  #   @items = Item.all
  # end
end

def show
  @item = Item.find_by(id: params[:id])
  @genres = Genre.all
end

def edit
end

end
