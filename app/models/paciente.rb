# == Schema Information
# Schema version: 20110721065357
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
#

class Paciente < ActiveRecord::Base
    attr_accessible :name, :firstsurname, :secondsurname, :idtype_id, :idcode, :profession, :comments,
                    :birthdate, :mobilephone, :familyphone, :homephone, :email, :addres, :zip, :codigo,
                    :clinicalhistories_attributes
                    
    attr_accessor  :fullname
    validates :name, :firstsurname, :presence => true,
                                    :length => { :maximum => 100 }
 #   validates :email, :allow_nil => true,
  #                    :format  => { :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }  
    validates :idcode,  :uniqueness => { :case_sensitive => false },
                        :format => { :with =>/\d{8}[a-zA-Z]$/i},
                        :allow_blank => true                                    
    validates :birthdate,
              :format => { :with => /(\d{2,4})(\-)(0[0-9]|1[1-2])(\-)(0[0-9]|1[0-9]|2[0-9]|3[0-1])/},
              :allow_blank => true
#Definimos el formato de mail
   # validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create }
#Definimos así mismo los atributos que serán obligatorios, nombre, primer apellido, tipo de tarifa
  #  validates :name, :firstsurname, :feetype, :presence => true
#Definimos el tamaño de los campos
   # validates :name, :firstsurname, :secondsurname, :profession, :email, :length => {:maximum => 80}
    #validates  :mobilephone, :familyphone, :homephone, :codigo, :numericality => true
    
    #Relación de paciente con tipo de tarifa, un paciente tiene una tarifa, una tarifa puede tener muchos pacientes
    has_many :clinicalhistories, :dependent => :destroy 
    has_many :events, :dependent => :destroy
    accepts_nested_attributes_for :clinicalhistories, :allow_destroy => true  

    before_create :fullname_f, :set_default_parameters

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
    
    #Función para definir qué queremos mostrar en el autcompletar.
    def fullname_f
      "#{self.name} #{self.firstsurname} #{self.secondsurname}, #{self.idcode}"
    end
    
      
    private
      def set_default_parameters
        code = Countreference.find_by_name('P')
        self.codigo = code.value
        code.value = code.value + 1
        code.save
      end

end

