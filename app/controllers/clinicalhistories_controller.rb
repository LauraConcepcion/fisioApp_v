class ClinicalhistoriesController < ApplicationController
  # GET /clinicalhistories
  # GET /clinicalhistories.xml
  def index
    @clinicalhistories = Clinicalhistory.page(params[:page])
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @clinicalhistories }
    end
  end
  # GET /clinicalhistories/1
  # GET /clinicalhistories/1.xml
  def show
    @tab = Tab.new
    @centers = Center.find(:all)
    @specialisttypes = Specialisttype.find(:all)
    @clinicalhistory = Clinicalhistory.find(params[:id])
    @paciente = Paciente.find(@clinicalhistory.paciente_id)
    @clinicalhistories = Clinicalhistory.where(:paciente_id => @paciente).order("assessmentdate DESC")
  end

  # GET /clinicalhistories/new
  # GET /clinicalhistories/new.xml
  def new
    @clinicalhistory = Clinicalhistory.new(params[:clinicalhistory])

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @clinicalhistory }
    end
  end

  # GET /clinicalhistories/1/edit
  def edit
    @clinicalhistory = Clinicalhistory.find(params[:id])
  end

  # POST /clinicalhistories
  # POST /clinicalhistories.xml
  def create
    @clinicalhistory = Clinicalhistory.new(params[:clinicalhistory])
    respond_to do |format|
      if @clinicalhistory.save
        format.html { redirect_to(edit_paciente_url, :notice => 'Se ha creado un nuevo tratamiento para el paciente') }
        format.xml  { render :xml => @paciente, :status => :created, :location => @paciente }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @paciente.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /clinicalhistories/1
  # PUT /clinicalhistories/1.xml
  def update
    @clinicalhistory = Clinicalhistory.find(params[:id])
    respond_to do |format|
      if @clinicalhistory.update_attributes(params[:clinicalhistory])
        format.html { redirect_to(edit_paciente_url, :notice => 'Clinicalhistory was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @clinicalhistory.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /clinicalhistories/1
  # DELETE /clinicalhistories/1.xml
  def destroy
    @clinicalhistory = Clinicalhistory.find(params[:id])
    @clinicalhistory.destroy

    respond_to do |format|
      format.html { redirect_to(clinicalhistories_url) }
      format.xml  { head :ok }
    end
  end

  def update_rate
    rates = Rate.where(:provenance_id=>params[:id]).order(:name) unless params[:id].blank?
    respond_to do |format|
      format.json { render :json => rates.map {|rate| [rate.name, rate.id] }.to_json }
    end
  end
  
  def search_clinicalhistory
    clinicalhistory = Clinicalhistory.where(:id=>params[:id]) unless params[:id].blank?
    respond_to do |format|
      format.json { render :json => clinicalhistory.map {|clinicalhistory| [clinicalhistory.medicalhistory, clinicalhistory.reasonconsultation, clinicalhistory.evaluation, clinicalhistory.physiotherapistdiagnostic, clinicalhistory.assessmentdate, clinicalhistory.treatment, clinicalhistory.medicaldiagnosic, clinicalhistory.provenance_id, clinicalhistory.comments, clinicalhistory.startdatetto, clinicalhistory.rate_id, clinicalhistory.enddatetto, clinicalhistory.expedient, clinicalhistory.authorization, clinicalhistory.authorizationcomments, clinicalhistory.code] }.to_json }
    end
  end
  
end
