class AddIndexToLogin < ActiveRecord::Migration[5.0]
  def change
    add_index :users, :login, unique: true
  end
end
