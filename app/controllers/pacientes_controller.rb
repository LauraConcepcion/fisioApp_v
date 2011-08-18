class PacientesController < ApplicationController
  # GET /pacientes
  # GET /pacientes.xml
  def index
    @centers = Center.find(:all)
    @specialisttypes = Specialisttype.find(:all)
    @provenances = Provenance.find(:all)
    @paciente = Paciente.find_by_id(params[:search])
  end

  # GET /pacientes/1
  # GET /pacientes/1.xml
  def show
    @paciente = Paciente.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @paciente }
    end
  end

  # GET /pacientes/new
  # GET /pacientes/new.xml
  def new
    @title = "Nuevo paciente"
    @tab = Tab.new
    @centers = Center.find(:all)
    @specialisttypes = Specialisttype.find(:all)
    @provenances = Provenance.find(:all)
    @paciente = Paciente.new
  end

  # GET /pacientes/1/edit
  def edit
    @tab = Tab.new
    @paciente = Paciente.find(params[:id])
    @centers = Center.all
    @specialisttypes = Specialisttype.find(:all)
    @provenances = Provenance.find(:all)
    @clinicalhistory = @paciente.clinicalhistories.order("assessmentdate DESC").first
  end

  # POST /pacientes
  # POST /pacientes.xml
  def create
    @paciente = Paciente.new(params[:paciente])
     respond_to do |format|
      if @paciente.save
        flash[:notice] = "Ficha de paciente creada correctamente"
        format.html { redirect_to(edit_paciente_path(@paciente)) }
        format.xml  { render :xml => @paciente, :status => :created, :location => @invoicehead }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @paciente.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # PUT /pacientes/1
  # PUT /pacientes/1.xml
  def update
    #Buscamos 
    @paciente = Paciente.find(params[:id])
    @clinicalhistory = Clinicalhistory.find_by_id(params[:clinicalhistory][:id])
    respond_to do |format|
      if @paciente.update_attributes(params[:paciente]) && @clinicalhistory.update_attributes(params[:clinicalhistory])
        flash[:notice] = "Ficha de paciente actualizada correctamente"
        format.html { redirect_to(edit_paciente_path(@paciente)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @paciente.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pacientes/1
  # DELETE /pacientes/1.xml
  def destroy
    @paciente = Paciente.find(params[:id])
    @paciente.destroy
    respond_to do |format|
      format.html { redirect_to(pacientes_url) }
      format.xml  { head :ok }
    end
  end
  
  def new_clinicalhistory
    clinicalhistory = Clinicalhistory.new
    clinicalhistories = [clinicalhistory]
    @paciente = Paciente.find_by_id(params[:id]) unless params[:id].blank?
    @paciente.clinicalhistories << clinicalhistory
    respond_to do |format|
      format.json { render :json => clinicalhistories.map {|clinicalhistory| [clinicalhistory.medicalhistory, clinicalhistory.reasonconsultation, clinicalhistory.evaluation, clinicalhistory.physiotherapistdiagnostic, clinicalhistory.assessmentdate, clinicalhistory.treatment, clinicalhistory.medicaldiagnosic, clinicalhistory.provenance_id, clinicalhistory.comments, clinicalhistory.startdatetto, clinicalhistory.rate_id, clinicalhistory.enddatetto, clinicalhistory.expedient, clinicalhistory.authorization, clinicalhistory.authorizationcomments, clinicalhistory.code, clinicalhistory.id] }.to_json }
    end
  end
end
