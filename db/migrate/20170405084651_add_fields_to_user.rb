class AddFieldsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string
    add_column :users, :surname, :string
    add_column :users, :grade_id, :integer
    add_column :users, :teacher, :boolean
    add_column :users, :librarian, :boolean
    add_index :users, :grade_id
  end
end
