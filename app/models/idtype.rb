class Idtype < ActiveRecord::Base
  attr_accessible :name
  has_many :paciente
end
