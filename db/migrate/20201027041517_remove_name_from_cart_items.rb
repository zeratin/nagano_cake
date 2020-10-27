class RemoveNameFromCartItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :cart_items, :name, :integer
  end
end
