class CreateAuthors < ActiveRecord::Migration[5.0]
  def self.up
    create_table :authors do |t|
      t.string :name
      t.string :surname

      t.timestamps
    end
  end

  def self.down
    drop_table :authors
  end

end
