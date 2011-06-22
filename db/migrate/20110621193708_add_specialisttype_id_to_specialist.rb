class AddSpecialisttypeIdToSpecialist < ActiveRecord::Migration
  def self.up
    add_column :specialists, :specialisttype_id, :integer
  end

  def self.down
    remove_column :specialists, :specialisttype_id
  end
end
