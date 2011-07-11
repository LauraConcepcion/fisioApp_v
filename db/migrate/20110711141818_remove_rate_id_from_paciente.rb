class RemoveRateIdFromPaciente < ActiveRecord::Migration
  def self.up
    remove_column :pacientes, :feetype_id
  end

  def self.down
    add_column :pacientes, :feetype_id, :string
  end
end
