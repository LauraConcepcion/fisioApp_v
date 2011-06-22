class CreateSpecialisttypes < ActiveRecord::Migration
  def self.up
    create_table :specialisttypes do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :specialisttypes
  end
end
