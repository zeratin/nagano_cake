class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      t.integer :tax_included_price
      t.integer :amount
      t.integer :making_status, defalut: 0
      t.timestamp :created_at, default: "now"
      t.timestamp :updated_at, default: "now"

      t.integer :order_id
      t.integer :item_id
      


      t.timestamps
    end
  end
end
