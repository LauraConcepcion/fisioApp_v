# == Schema Information
# Schema version: 20110709163643
#
# Table name: provenances
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

#Esta clase indicará el origen del paciente, puede ser
#privado, por convenio o mutua. Cada procedencia del paciente
#tendrá un conjunto de tarifas a aplicar.
class Provenance < ActiveRecord::Base
  attr_accessible  :description, :name
  has_many  :rate
  
end
