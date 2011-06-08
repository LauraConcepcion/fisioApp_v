# == Schema Information
# Schema version: 20110608141649
#
# Table name: pacientes
#
#  id            :integer         not null, primary key
#  name          :string(255)
#  firstsurname  :string(255)
#  secondsurname :string(255)
#  idtype        :integer
#  idcode        :string(255)
#  profession    :string(255)
#  feetype_id    :integer
#  comments      :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  birthdate     :date
#  mobilephone   :integer
#  familyphone   :integer
#  homephone     :integer
#  email         :string(255)
#  addres        :text
#  zip           :string(255)
#  codigo        :integer
#

class Paciente < ActiveRecord::Base
    attr_accessible :name, :firstsurname, :secondsurname, :idtype, :idcode, :profession, :feetype_id, :comments,
                    :birthdate, :mobilephone, :familyphone, :homephone, :email, :addres, :zip, :codigo
#Definimos el formato de mail
    validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create }
#Definimos así mismo los atributos que serán obligatorios, nombre, primer apellido, tipo de tarifa
    validates :name, :firstsurname, :feedtype, :presence => true
#Definimos el tamaño de los campos
    validates :name, :firstsurname, :secondsurname, :prefession, :email, :length => {:maximum => 20}
    validates :feetype, :movilephone, :familyphone, :homephone, :codigo, :numericality => true
    
    #Relación de paciente con tipo de tarifa, un paciente tiene una tarifa, una tarifa puede tener muchos pacientes
    belongs_to :feetype      
end

