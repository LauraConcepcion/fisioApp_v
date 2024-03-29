# == Schema Information
# Schema version: 20110916102239
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
#  comments      :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  birthdate     :string(255)
#  mobilephone   :integer
#  familyphone   :integer
#  homephone     :integer
#  email         :string(255)
#  addres        :string(255)
#  zip           :string(255)
#  codigo        :integer
#  idtype_id     :integer
#  fullname      :string(255)
#

class Paciente < ActiveRecord::Base
  #El parámetro código alamcenará un id del usuario, a parte del dni que no es obligatorio, y se generará automáticamente
    attr_accessible :name, :firstsurname, :secondsurname, :idtype_id, :idcode, :profession, :comments,
                    :birthdate, :mobilephone, :familyphone, :homephone, :email, :addres, :zip, :codigo,
                    :fullname,
                    :clinicalhistories_attributes
                    
    validates :name, :firstsurname, :presence => true,
                                    :length => { :maximum => 100 }
    validates :idcode,  :uniqueness => { :case_sensitive => false },
                        :format => { :with =>/\d{8}[a-zA-Z]$/i},
                        :allow_blank => true                                    
    validates :birthdate,
              :format => { :with => /(\d{2,4})(\-)(0[0-9]|1[1-2])(\-)(0[0-9]|1[0-9]|2[0-9]|3[0-1])/},
              :allow_blank => true
    #Definimos el formato de mail
    validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i },
              :allow_blank => true
    #Definimos el tamaño de los campos
    validates :profession, :email, :length => {:maximum => 150}
    #Relación de paciente con tipo de tarifa, un paciente tiene una tarifa, una tarifa puede tener muchos pacientes
    has_many :clinicalhistories, :dependent => :destroy 
    has_many :events, :dependent => :destroy
    accepts_nested_attributes_for :clinicalhistories, :allow_destroy => true  

    before_create  :set_default_parameters

    belongs_to  :idtype
    
    def self.age(birthdate)
      if !birthdate.blank?
        ((DateTime.now - birthdate)/365).to_i
      end
    end 
    #Función para definir qué queremos mostrar en el autcompletar.
    def funky_method
      "#{self.name} #{self.firstsurname} #{self.secondsurname}, #{self.idcode}"
    end
    
      
    private
      def set_default_parameters
        code = Countreference.find_by_name('P')
        self.codigo = code.value
        code.value = code.value + 1
        self.fullname = "#{self.name} #{self.firstsurname} #{self.secondsurname}, #{self.idcode}"
        code.save
      end

end

