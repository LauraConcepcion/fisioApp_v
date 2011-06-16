class Countreference < ActiveRecord::Base
  attr_accessible :name, :value
  
  def self.valuenow(name)
    if !name.blank?
      where("name = '#{name}'")
    end
  end
end
