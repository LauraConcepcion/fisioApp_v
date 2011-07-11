# == Schema Information
# Schema version: 20110711075934
#
# Table name: rates
#
#  id            :integer         not null, primary key
#  name          :string(255)
#  description   :string(255)
#  sessions      :integer
#  rate          :float
#  provenance_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class Rate < ActiveRecord::Base
  attr_accessible :name, :rate, :provenance_id
  belongs_to :provenance  
  has_many :paciente
end
