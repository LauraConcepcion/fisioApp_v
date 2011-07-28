# == Schema Information
# Schema version: 20110721065357
#
# Table name: invoicelines
#
#  id             :integer         not null, primary key
#  linenumber     :integer
#  concept        :string(255)
#  sessions       :integer
#  price          :float
#  total          :float
#  invoicehead_id :integer
#  created_at     :datetime
#  updated_at     :datetime
#

class Invoiceline < ActiveRecord::Base
  attr_accessible :linenumber,:concept,:sessions,:price,:total, :treatmentdate
  belongs_to  :invoicehead
  belongs_to  :event
end
