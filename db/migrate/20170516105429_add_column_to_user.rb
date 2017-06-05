class AddColumnToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :force_change_pass, :boolean, default: true
  end
end
