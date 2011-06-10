class PacientesController < ApplicationController
  # GET /pacientes
  # GET /pacientes.xml
  def index
    @tab = Tab.new
    @pacientes = Paciente.where(:name => params[:name])
    #, :firstsurname => params[:firstsurname],:secondsurname => params[:secondsurname], :idcode => params[:idcode]
    if @pacientes.blank?
      @pacientes = Paciente.all
    end
    # if @pacientes.size == 1
      # @paciente = Paciente.find_by_idcode(@pacientes.idcode)
      # respond_to do |format|
        # format.html{redirect_to(@paciente)}
      # end
    # end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pacientes }
    end
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
    @paciente = Paciente.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @paciente }
    end
  end

  # GET /pacientes/1/edit
  def edit
    @paciente = Paciente.find(params[:id])
    #@clinicalhistories = Clinicalhistory.page(params[:page])  
    @clinicalhistories = Clinicalhistory.where(:paciente_id => @paciente).page(params[:page])
    # if @clinicalhistories.blank?
      # @clinicalhistory = Clinicalhistory.new
    # else
      # @clinicalhistory = @clinicalhistories.first
    # end
    # @clinicalhistories = Clinicalhistory.where(:paciente_id => @paciente).page params[:page]
  # 
  end

  # POST /pacientes
  # POST /pacientes.xml
  def create
    @paciente = Paciente.new(params[:paciente])

    respond_to do |format|
      if @paciente.save
        format.html { redirect_to(@paciente, :notice => 'El paciente ha sido creado correctamente.') }
        format.xml  { render :xml => @paciente, :status => :created, :location => @paciente }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @paciente.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pacientes/1
  # PUT /pacientes/1.xml
  def update
    @paciente = Paciente.find(params[:id])

    respond_to do |format|
      if @paciente.update_attributes(params[:paciente])
        format.html { redirect_to(@paciente, :notice => 'Los datos del paciente se han actualizado correctamente.') }
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
end
