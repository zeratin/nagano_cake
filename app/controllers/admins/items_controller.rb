class Admins::ItemsController < ApplicationController

  def index
    @items = Item.all
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admins_items_path
    end
  end

  def new
    @item = Item.new
  end


  def destroy
    @item = Item.find(params[:id])
    if @item.destroy
      redirect_to admins_items_path
    end
  end


  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admins_items_path
    end
  end

  private
    def item_params
      params.require(:item).permit(:name, :introduction, :price, :image)
    end
end
