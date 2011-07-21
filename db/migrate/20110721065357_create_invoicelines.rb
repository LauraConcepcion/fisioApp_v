class CreateInvoicelines < ActiveRecord::Migration
  def self.up
    create_table :invoicelines do |t|
      t.integer :linenumber
      t.string :concept
      t.integer :sessions
      t.float :price
      t.float :total
      t.integer :invoicehead_id

      t.timestamps
    end
  end

  def self.down
    drop_table :invoicelines
  end
end
