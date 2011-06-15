class PacientesController < ApplicationController
  # GET /pacientes
  # GET /pacientes.xml
  def index
    @paciente = Paciente.new
    @clinicalhistory = Clinicalhistory.new
    @tab = Tab.new
    name = params[:name]
    firstsurname = params[:firstsurname]
    secondsurname = params[:secondsurname]
    idcode = params[:idcode] 
    @pacientes = Paciente.search(name, firstsurname, secondsurname,idcode)
    if @pacientes.blank?
      @pacientes = Paciente.all
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pacientes }
    end
  end

  # GET /pacientes/1
  # GET /pacientes/1.xml
  def show
    @paciente = Paciente.find(params[:id])
    @clinicalhistories = Clinicalhistory.where(:paciente_id => @paciente).order(:code).page(params[:page])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @paciente }
    end
  end

  # GET /pacientes/new
  # GET /pacientes/new.xml
  def new
    @paciente = Paciente.new
    @clinicalhistory = Clinicalhistory.new
    respond_to do |format|
      format.html# new.html.erb
      format.xml  { render :xml => @paciente }
    end
  end

  # GET /pacientes/1/edit
  def edit
    @paciente = Paciente.find(params[:id])
    @clinicalhistories = Clinicalhistory.where(:paciente_id => @paciente).page(params[:page])
  end

  # POST /pacientes
  # POST /pacientes.xml
  def create
    @paciente = Paciente.new(params[:paciente])
    @clinicalhistory = Clinicalhistory.new(params[:clinicalhistory])
    @paciente.clinicalhistories << @clinicalhistory
    respond_to do |format|
      if @paciente.save
        if @clinicalhistory.save
          flash[:notice] = "Ficha de paciente creada correctamente"
   #     @clinicalhistories = Clinicalhistory.where(:paciente_id => @paciente).page(params[:page])
          format.html {redirect_to(pacientes_url)}
          format.xml  { render :xml => @paciente, :status => :created, :location => @paciente }
        end
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
    @clinicalhistory = Clinicalhistory.find_by_code(params[:clinicalhistory][:code])
    @paciente.attributes = params[:paciente]
    @duplicado = params[:clinicalhistory][:duplicado]
    flash[:notice] = "Valor del duplicado" + "#{@duplicado}"
  #  @clinicalhistory = Clinicalhistory.find_by_code(params[:clinicalhistory][:code])
    if @duplicado == "1"
      @clinicalhistory = Clinicalhistory.new(params[:clinicalhistory])
      @paciente.clinicalhistories << @clinicalhistory
      respond_to do |format|
        if @paciente.save
          format.html {redirect_to(edit_paciente_url)}
          format.xml {head :ok}
        end
      end
    else
      respond_to do |format|
        if @paciente.update_attributes(params[:paciente])
          if @clinicalhistory.update_attributes(params[:clinicalhistory])
            format.html {  redirect_to(edit_paciente_url)}
              #redirect_to(:action=>"edit", :controller=>"pacientes", :notice => 'Los datos del paciente se han actualizado correctamente.') }
           format.xml  { head :ok }
          end
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @paciente.errors, :status => :unprocessable_entity }
        end
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
  
  def createclinicalhistory
    @paciente = Paciente.find(params[:id])
    @clinicalhistory = Clinicalhistory.new(params[:clinicalhistory])
    @paciente.clinicalhistories << @clinicalhistory
      if @paciente.save
        @clinicalhistories = Clinicalhistory.where(:paciente_id => @paciente).page(params[:page])
        format.html {redirect_to(pacientes_url)}
        format.xml  { render :xml => @paciente, :status => :created, :location => @paciente }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @paciente.errors, :status => :unprocessable_entity }
      end
    end
    def creartrata
      @clinicalhistory = Clinicalhistory.new
    end
end
