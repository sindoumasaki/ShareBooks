class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title,                null: false
      t.text :digest,                 null: false
      t.text :book_image_id
      t.integer :user_id,             null: false
      t.integer :book_big_genre_id,   null: false

      t.timestamps
    end
  end
end
