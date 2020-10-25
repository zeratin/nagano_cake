class CartItem < ApplicationRecord
    belongs_to :customer
    belongs_to :item
    # has_many :line_items, dependent: :destroy
    
    def total_price
		cart_item.tax_included_price * amount
	end
	
	def cart_total_price
		cart_items.to_a.sum { |item| item.total_price }
	end
end
