class AddTreatmentdateToInvoicelines < ActiveRecord::Migration
  def self.up
    add_column :invoicelines, :treatmentdate, :date
  end

  def self.down
    remove_column :invoicelines, :treatmentdate
  end
end
