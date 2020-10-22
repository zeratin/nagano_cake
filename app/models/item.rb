class Item < ApplicationRecord
  validates :name, presence: true

  has_many :cart_items, dependent: :destroy
  has_many :item_genres, dependent: :destroy
  has_many :genres, through: :item_genres
  scope :regexp_days, -> (pattern){ where("items.days REGEXP ?", pattern) }
  attachment :image

  def self.search(params)
    items = Item.where(nil)
    items = items.where('name > ?', params[:name]) if params[:name].present?

    items = items.includes(:genres).where(genres: {name: params[:genre]}) if params[:genre].present?

    items = items.offset(params[:min]) if params[:min].present?
    items = items.limit(params[:max]) if params[:max].present?
  end

  belongs_to :genre, optional: true
  # ジャンル情報なしで情報を仮登録するためにoptional: trueの記述をしました。必要なくなれば消していいです。
  # 参考記事です。https://qiita.com/tanaka7014/items/50a1a953b3f440cbe481
end
