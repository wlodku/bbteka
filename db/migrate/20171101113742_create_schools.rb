class CreateSchools < ActiveRecord::Migration[5.0]
  def change
    create_table :schools do |t|
      t.string :name
      t.string :short

      t.timestamps
    end
    add_column :users, :school_id, :integer
    add_index :users, :school_id
  end
end
