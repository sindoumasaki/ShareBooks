class CreateBookSmallGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :book_small_genres do |t|
      t.string :small_genre_name,       null: false
      t.integer :book_big_genre_id,    null: false

      t.timestamps
    end
  end
end
