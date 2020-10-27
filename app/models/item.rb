class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  has_many :orders
  belongs_to :genre, optional: true

  validates :name, presence: true

  scope :regexp_days, -> (pattern){ where("items.days REGEXP ?", pattern) }
  attachment :image
  # has_many :customer, through: :cart_items, source: :customer


  def save_genres(genre_ids)
    genre_ids.each do |genre_id|
      item_genre = Genre.find_by(id: genre_id)
      self.genres << item_genre
    end
  end


  # ジャンル情報なしで情報を仮登録するにはoptional: trueの記述をするといいです。必要なくなれば消していいです。
  # 参考記事です。https://qiita.com/tanaka7014/items/50a1a953b3f440cbe481
end
