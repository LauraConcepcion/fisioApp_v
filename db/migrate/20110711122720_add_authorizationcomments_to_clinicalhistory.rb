class AddAuthorizationcommentsToClinicalhistory < ActiveRecord::Migration
  def self.up
    add_column :clinicalhistories, :authorizationcomments, :string
  end

  def self.down
    remove_column :clinicalhistories, :authorizationcomments
  end
end
