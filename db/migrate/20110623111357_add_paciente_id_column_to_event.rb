class AddPacienteIdColumnToEvent < ActiveRecord::Migration
  def self.up
    add_column :events, :patient_id, :integer
  end

  def self.down
    remove_column :events, :patient_id
  end
end
