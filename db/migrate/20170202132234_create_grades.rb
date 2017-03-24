class CreateGrades < ActiveRecord::Migration[5.0]
  def self.up
    create_table :grades do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :grades
  end

end
