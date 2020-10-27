class HomesController < ApplicationController
  def top
    @genres = Genre.where(is_active: true)
    @item = Item.all.order(created_at: :desc).limit(4)
  end

  def about
  end
end
