class Admins::GenresController < ApplicationController
  before_action :authenticate_admin!, except: [:show]

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
       flash[:notice] = "ジャンルを追加しました"
       redirect_to admins_genres_path
    else
       @genres = Genre.all
       render :index and return
    end
  end

  def show
    @items = Item.all
    @genre = Genre.find(params[:id])
    @genres = @genre.items.order
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      flash[:success] = "ジャンルを変更しました"
      redirect_to admins_genres_path
      if @genre.is_active == true
        @genre.items.each do |item|
          # item.is_sale = false
          item.save
        end
      end
    else
      render :edit and return
    end
  end

  private
  def genre_params
    params.require(:genre).permit(:name, :is_active)
  end
end
