class AddNewcolumsToClinicalhistory < ActiveRecord::Migration
  def self.up
    add_column :clinicalhistories, :expedient, :string
    add_column :clinicalhistories, :authorization, :string
  end

  def self.down
    remove_column :clinicalhistories, :authorization
    remove_column :clinicalhistories, :expedient
  end
end
