class AddNameKanaToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :first_name_kana, :string
    add_column :customers, :last_name_kana, :string
    add_column :customers, :phone_number,:string
  end
end
