class AddFieldsToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :publisher_id, :integer
    add_column :books, :description, :text
    add_column :books, :required, :boolean
    add_index :books, :publisher_id
  end
end
