class CreateBookFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :book_favorites do |t|
      t.integer :user_id,   null: false
      t.integer :book_id,   null: false

      t.timestamps
    end
  end
end
