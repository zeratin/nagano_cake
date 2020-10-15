class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      
      t.string :name
      t.string :postal_code
      t.string :address
      t.timestamp :created_at, default: "now"
      t.timestamp :updated_at, default: "now"
      t.integer :customer_id
      

      t.timestamps
    end
  end
end

