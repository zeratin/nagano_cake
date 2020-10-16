class Admin::GenresController < ApplicationController

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
  end

  def show
  end

  def edit
    @genre = Genre.find(params[:id])
  end


  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
    else render:edit and retrun
    end
  end
end
