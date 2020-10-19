class CreateItemGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :item_genres do |t|

      t.bigint :item_id
      t.bigint :genre_id
      t.index [:item_id], name: "index_item_genres_on_item_id"
      t.index [:genre_id], name: "index_item_genres_on_genre_id"
      t.timestamps
    end
  end
end
