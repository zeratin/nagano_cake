class ItemsController < ApplicationController

def index
  @items = Item.all
  @item = Item.new
end

def show
  @item = Item.find(params[:id])
end



end
