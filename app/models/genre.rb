class Genre < ApplicationRecord
<<<<<<< HEAD
<<<<<<< HEAD
  has_many :items
  varidates :name, presence: true
=======
>>>>>>> bc248502d2348519f43beb8d5814096b0666745d
=======
  has_many :item_genres, dependent: :destroy
  has_many :items, through: :item_genres
  validates :name, uniqueness: true
>>>>>>> f2ee6704a4fee058d7f6f0ee1cd861718d0d4834
end
