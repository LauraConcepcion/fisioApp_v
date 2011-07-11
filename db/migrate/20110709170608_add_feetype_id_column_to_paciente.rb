class AddFeetypeIdColumnToPaciente < ActiveRecord::Migration
  def self.up
    add_column :pacientes, :feetype_id, :integer
  end

  def self.down
    remove_column :pacientes, :feetype_id
  end
end
