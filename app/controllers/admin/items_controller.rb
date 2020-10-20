class Admin::ItemsController < ApplicationController
  before_action :set_items, only[:show, :edit, :update]
  before_action :set_genres, only[:new, :eidit, :index, :create, :update]

  def new
    @item = Item.new
  end

  def create
   @item = Item.new(item_params)
    if @item.save
     flash[:notice] = "新商品を登録しました"
     redirect_to adin_item_path(@item)
    else
      render :new
    end
  end

  def index
   @items = Item.all.page(params[:page]).per(10)
  end

  def show
  end

  def edit
  end

  def update
    @item = Item.update(item_params)
    if flash[:notice] = "商品内容を変更しました"
        redirect_to admin_item_path(@item)
    else
        render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :introduction,
       :genre_id, :tax_included_price, :is_active)
  end

  def set_genres
    @genres = Genre.where(is_active: true)
  end
end
