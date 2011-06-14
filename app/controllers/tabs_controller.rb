class TabsController < ApplicationController
  # GET /tabs
  # GET /tabs.xml
  autocomplete :paciente, :name, :full => true, :extra_data => [:firstsurname, :secondsurname, :idcode]
  autocomplete :paciente, :firstsurname, :full => true
  autocomplete :paciente, :secondsurname, :full => true
  autocomplete :paciente, :idcode
  def create
    name = params[:paciente_name]
    firstsurname = params[:paciente_firstsurname]
    secondsurname = params[:paciente_secondsurname]
    idcode = params[:paciente_idcode] 
    @pacientes = Paciente.search(name, firstsurname, secondsurname,idcode)
    if @pacientes.blank?
      @pacientes = Paciente.all
    end
    redirect_to(pacientes_url)  
  end
end
    