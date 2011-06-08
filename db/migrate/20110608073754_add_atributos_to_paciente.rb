class AddAtributosToPaciente < ActiveRecord::Migration
  def self.up
    add_column :pacientes, :birthdate, :date
    add_column :pacientes, :mobilephone, :integer
    add_column :pacientes, :familyphone, :integer
    add_column :pacientes, :homephone, :integer
    add_column :pacientes, :email, :string
    add_column :pacientes, :addres, :text
    add_column :pacientes, :zip, :string
    add_column :pacientes, :codigo, :integer
  end

  def self.down
    remove_column :pacientes, :codigo
    remove_column :pacientes, :zip
    remove_column :pacientes, :addres
    remove_column :pacientes, :email
    remove_column :pacientes, :homephone
    remove_column :pacientes, :familyphone
    remove_column :pacientes, :mobilephone
    remove_column :pacientes, :birthdate
  end
end
