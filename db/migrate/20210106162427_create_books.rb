class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title,          null: false
      t.text :digest,           null: false
      t.string :book_image_id

      t.timestamps
    end
  end
end
