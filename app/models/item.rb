class Item < ApplicationRecord
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
