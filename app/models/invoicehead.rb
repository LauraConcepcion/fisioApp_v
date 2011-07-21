# == Schema Information
# Schema version: 20110721065357
#
# Table name: invoiceheads
#
#  id            :integer         not null, primary key
#  Name          :string(255)
#  FirstSurname  :string(255)
#  secondsurname :string(255)
#  comments      :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

class Invoicehead < ActiveRecord::Base
  has_many  :invoiceline
end
