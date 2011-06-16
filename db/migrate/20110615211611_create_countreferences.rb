class CreateCountreferences < ActiveRecord::Migration
  def self.up
    create_table :countreferences do |t|
      t.string :name
      t.integer :value

      t.timestamps
    end
  end

  def self.down
    drop_table :countreferences
  end
end
