class RemoveFeetypeIdFromPacientes < ActiveRecord::Migration
  def self.up
    remove_column :pacientes, :feetype_id
  end

  def self.down
    add_column :pacientes, :feetype_id, :integer
  end
end
