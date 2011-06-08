class AddAttributesToTabs < ActiveRecord::Migration
  def self.up
    add_column :tabs, :paciente_secondsurname, :string
    add_column :tabs, :paciente_idcode, :string
  end

  def self.down
    remove_column :tabs, :paciente_idcode
    remove_column :tabs, :paciente_secondsurname
  end
end
