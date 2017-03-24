class CreateLoans < ActiveRecord::Migration[5.0]
  def self.up
    create_table :loans do |t|
      t.integer :book_id
      t.integer :user_id
      t.date :date_out
      t.date :date_due
      t.date :date_returned

      t.timestamps
    end
    add_index :loans, [:book_id]
    add_index :loans, [:user_id]
  end

  def self.down
    drop_table :loans
  end
end
