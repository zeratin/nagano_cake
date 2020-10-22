class Item < ApplicationRecord
  has_many :item_genres, dependent: :destroy
  has_many :genres, through: :item_genres

  def save_genres(genre_ids)
    genre_ids.each do |genre_id|
      item_genre = Genre.find_by(id: genre_id)
      self.genres << item_genre
    end
  end
end
