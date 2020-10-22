class Genre <
  has_many :item_genres, dependent: :destroy
  has_many :items, through: :item_genres
  validates :name, presence: true

  has_many :items
  varidates :name, presence: true

end
