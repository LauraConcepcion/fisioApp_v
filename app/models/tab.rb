# == Schema Information
# Schema version: 20110607145605
#
# Table name: tabs
#
#  id                     :integer         not null, primary key
#  paciente_name          :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  paciente_firstsurname  :text
#  paciente_secondsurname :string(255)
#  paciente_idcode        :string(255)
#

class Tab < ActiveRecord::Base
  attr_accessor :search
end
