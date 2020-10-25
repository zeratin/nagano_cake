class Admins::ItemsController < ApplicationController
  def index
    @items = Item.all
    @item = Item.new
    @genre = Genre.new
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admins_items_path
    end
  end

  def show
    @item = Item.find(params[:id])
    @tax_included_price = @item.price * 1.1
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admins_items_path
    end
  end

  private
    def item_params
      params.require(:item).permit(:name, :introduction, :price, :image, :genre_id)
    end
end