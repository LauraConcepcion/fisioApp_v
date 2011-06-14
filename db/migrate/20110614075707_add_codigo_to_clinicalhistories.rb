class AddCodigoToClinicalhistories < ActiveRecord::Migration
  def self.up
    add_column :clinicalhistories, :code, :integer
  end

  def self.down
    remove_column :clinicalhistories, :code
  end
end
