# == Schema Information
# Schema version: 20110608141649
#
# Table name: feetypes
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :string(255)
#  sessions    :integer
#  rate        :float
#  created_at  :datetime
#  updated_at  :datetime
#

class Feetype < ActiveRecord::Base
  attr_accessible :name, :rate
  has_many :paciente
end
