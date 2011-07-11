class CreateRates < ActiveRecord::Migration
  def self.up
    create_table :rates do |t|
      t.string :name
      t.string :description
      t.integer :sessions
      t.float :rate
      t.integer :provenance_id

      t.timestamps
    end
  end

  def self.down
    drop_table :rates
  end
end
