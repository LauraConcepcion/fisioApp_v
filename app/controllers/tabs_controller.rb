class TabsController < ApplicationController
  # GET /tabs
  # GET /tabs.xml
  autocomplete :paciente, :name, :full => true, :display_value => :funky_method
  def index
    @tab = Tab.new
    @paciente = Paciente.search(params[:search])
    @clinicalhistories = Clinicalhistory.where(:paciente_id => @paciente).order("assessmentdate DESC").page(params[:page])
  end 
end
    