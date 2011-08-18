class AddSpecialisttypeIdToClinicalhistories < ActiveRecord::Migration
  def self.up
    add_column :clinicalhistories, :specialisttype_id, :integer
  end

  def self.down
    remove_column :clinicalhistories, :specialisttype_id
  end
end
