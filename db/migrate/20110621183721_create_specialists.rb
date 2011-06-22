class CreateSpecialists < ActiveRecord::Migration
  def self.up
    create_table :specialists do |t|
      t.string  :name
      t.string  :email
      t.integer :phone1
      t.integer :phone2

      t.timestamps
    end
  end

  def self.down
    drop_table :specialists
  end
end
