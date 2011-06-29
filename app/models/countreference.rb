# == Schema Information
# Schema version: 20110623111357
#
# Table name: countreferences
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  value      :integer
#  created_at :datetime
#  updated_at :datetime
#

class Countreference < ActiveRecord::Base
  attr_accessible :name, :value
  
  def self.valuenow(name)
    if !name.blank?
      where("name = '#{name}'")
    end
  end
end
