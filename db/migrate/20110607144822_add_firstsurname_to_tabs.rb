class AddFirstsurnameToTabs < ActiveRecord::Migration
  def self.up
    add_column :tabs, :paciente_firstsurname, :text
  end

  def self.down
    remove_column :tabs, :paciente_firstsurname
  end
end
