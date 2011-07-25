class AddPacienteIdToInvoicehead < ActiveRecord::Migration
  def self.up
    add_column :invoiceheads, :paciente_id, :integer
  end

  def self.down
    remove_column :invoiceheads, :paciente_id
  end
end
