class CreateBooks < ActiveRecord::Migration[8.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :genre
      t.string :status
      t.text :notes

      t.timestamps
    end
    add_index :books,[user_id, :created_at]
  end
end
