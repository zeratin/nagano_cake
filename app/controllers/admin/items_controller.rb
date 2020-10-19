class Admin::ItemsController < ApplicationController
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
  end

  private

  def product_params
    params.require(:product).permit(:name, :image, :introduction,
       :genre_id, :, :is_active)
  end

  def set_genres
    @genres = Genre.where(is_active: true)
  end
end
