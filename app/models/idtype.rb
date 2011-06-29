# == Schema Information
# Schema version: 20110623111357
#
# Table name: idtypes
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Idtype < ActiveRecord::Base
  attr_accessible :name
  has_many :paciente
end
