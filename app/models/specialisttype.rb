class Specialisttype < ActiveRecord::Base
  attr_accessible :name
  has_many  :specialist
end
