class CreateProvenances < ActiveRecord::Migration
  def self.up
    create_table :provenances do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :provenances
  end
end
