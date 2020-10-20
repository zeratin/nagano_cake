class AddTaxIncludedPriceToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :tax_included_price, :integer
  end
end
