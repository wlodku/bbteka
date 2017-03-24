class CreateAuthorBooks < ActiveRecord::Migration[5.0]
  def self.up
    create_table :author_books do |t|
      t.integer :book_id
      t.integer :author_id

      t.timestamps
    end

    add_index :author_books, [:book_id]
    add_index :author_books, [:author_id]
  end

  def self.down
    drop_table :author_books
  end

end
