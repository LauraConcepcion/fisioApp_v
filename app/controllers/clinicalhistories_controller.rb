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
    @edad = Paciente.age(@paciente.birthdate.to_date)
  end

  # GET /clinicalhistories/new
  # GET /clinicalhistories/new.xml
  def new
    @clinicalhistory = Clinicalhistory.new(params[:clinicalhistory])
    @paciente = Paciente.new
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
#    @paciente = Paciente.find(params[:paciente])
    @clinicalhistory = Clinicalhistory.new(params[:clinicalhistory])
 #   @paciente.clinicalhistories << @clinicalhistory
    respond_to do |format|
  #    if @paciente.save
        if @clinicalhistory.save
   #       @clinicalhistories = Clinicalhistory.where(:paciente_id => @paciente).page(params[:page])
          format.html { redirect_to(edit_paciente_url, :notice => 'Se ha creado un nuevo tratamiento para el paciente') }
          format.xml  { render :xml => @paciente, :status => :created, :location => @paciente }
    #    end
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
  #  @paciente = @clinicalhistory.paciente_id
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
end
