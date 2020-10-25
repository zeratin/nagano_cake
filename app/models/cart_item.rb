class CartItem < ApplicationRecord
    belongs_to :customer
    belongs_to :item
    # has_many :line_items, dependent: :destroy

end
