class Item < ApplicationRecord
<<<<<<< HEAD

  belongs_to :genre
=======
  has_many :item_genres, dependent: :destroy
  has_many :genres, through: :item_genres
  scope :regexp_days, -> (pattern){ where("items.days REGEXP ?", pattern) }

  def self.search(params)

    items = Item.where(nil)
    items = items.where('name > ?', params[:name]) if params[:name].present?

    items = items.includes(:genres).where(genres: {name: params[:genre]}) if params[:genre].present?

    items = items.offset(params[:min]) if params[:min].present?
    items = items.limit(params[:max]) if params[:max].present?

    items
  end
>>>>>>> f2ee6704a4fee058d7f6f0ee1cd861718d0d4834
end
