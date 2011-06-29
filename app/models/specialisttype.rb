# == Schema Information
# Schema version: 20110623111357
#
# Table name: specialisttypes
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Specialisttype < ActiveRecord::Base
  attr_accessible :name
  has_many  :specialist
end
