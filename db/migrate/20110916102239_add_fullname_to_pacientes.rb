class AddFullnameToPacientes < ActiveRecord::Migration
  def self.up
    add_column :pacientes, :fullname, :string
  end

  def self.down
    remove_column :pacientes, :fullname
  end
end
