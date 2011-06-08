class CreateFeetypes < ActiveRecord::Migration
  def self.up
    create_table :feetypes do |t|
      t.string :name
      t.string :description
      t.integer :sessions
      t.float :rate

      t.timestamps
    end
  end

  def self.down
    drop_table :feetypes
  end
end
