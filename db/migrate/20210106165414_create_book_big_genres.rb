class CreateBookBigGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :book_big_genres do |t|
      t.string :big_genre_name,   null: false

      t.timestamps
    end
  end
end
