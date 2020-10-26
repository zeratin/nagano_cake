class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
            t.integer :shipping_cost
      t.string :address
      t.integer :postal_code
      t.string :name
      t.string :payment_method, defalut: 0
      t.integer :status, defalut: 0
      t.integer :total_payment
      t.timestamp :created_at, default: "now"
      t.timestamp :updated_at, default: "now"

      t.integer :customer_id

      t.timestamps
    end
  end
end
