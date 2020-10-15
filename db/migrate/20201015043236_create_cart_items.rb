class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|

      t.integer :name
      t.timestamp :created_at, default: "now"
      t.timestamp :updated_at, default: "now"
      
      t.integer :item_id
      t.integer :customer_id

      t.timestamps
    end
  end
end
