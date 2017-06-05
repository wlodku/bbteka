class AddTemporaryPasswordToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :temporary_password, :string
  end
end
