class Item < ApplicationRecord
  has_many :cart_items
  has_many :order_details
  has_many :item_genres, dependent: :destroy
  has_many :genres, through: :item_genres
  has_many :orders
  scope :regexp_days, -> (pattern){ where("items.days REGEXP ?", pattern) }
  attachment :image
  # has_many :customer, through: :cart_items, source: :customer
  
  belongs_to :genre


  def save_genres(genre_ids)
    genre_ids.each do |genre_id|
      item_genre = Genre.find_by(id: genre_id)
      self.genres << item_genre
    end
  end
  
  


  belongs_to :genre, optional: true
  # ジャンル情報なしで情報を仮登録するためにoptional: trueの記述をしました。必要なくなれば消していいです。
  # 参考記事です。https://qiita.com/tanaka7014/items/50a1a953b3f440cbe481
end
