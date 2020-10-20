class Admin::ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
  end

  def index

  end

  def show
  end

  def edit
  end

  def update
  end

  private

  def product_params
    params.require(:product).permit(:name, :image, :introduction,
       :genre_id, :tax_out_price, :is_sale)
  end

  def set_genres
    @genres = Genre.where(is_active: false)
  end
end
