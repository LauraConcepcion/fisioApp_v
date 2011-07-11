class Rate < ActiveRecord::Base
  attr_accessible :name, :rate, :provenance_id
  belongs_to :provenance  
  has_many :paciente
end
