class AddLoginToAdminUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :admin_users, :login, :string
    add_index :admin_users, :login, unique: true
  end
end
