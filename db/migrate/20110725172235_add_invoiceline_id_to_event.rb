class AddInvoicelineIdToEvent < ActiveRecord::Migration
  def self.up
    add_column :events, :invoiceline_id, :integer
  end

  def self.down
    remove_column :events, :invoiceline_id
  end
end
