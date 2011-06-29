# == Schema Information
# Schema version: 20110623111357
#
# Table name: specialists
#
#  id                :integer         not null, primary key
#  name              :string(255)
#  email             :string(255)
#  phone1            :integer
#  phone2            :integer
#  created_at        :datetime
#  updated_at        :datetime
#  specialisttype_id :integer
#

class Specialist < ActiveRecord::Base
  attr_accessible  :name,  :specialisttype_id, :email, :phone1, :phone2
  has_many  :events
  belongs_to  :specialisttype
end
