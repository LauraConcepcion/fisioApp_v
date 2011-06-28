class PacientesController < ApplicationController
  # GET /pacientes
  # GET /pacientes.xml
  def index
    @tab = Tab.new
    @centers = Center.find(:all)
    @specialisttypes = Specialisttype.find(:all)
    if Paciente.find_by_id(params[:search]).nil?
      @paciente = Paciente.new
      @clinicalhistory = Clinicalhistory.new
    else
      @paciente = Paciente.find_by_id(params[:search])
      @clinicalhistory = Clinicalhistory.where(:paciente_id => @paciente).order("assessmentdate DESC").first
      @clinicalhistories = Clinicalhistory.where(:paciente_id => @paciente).order("assessmentdate DESC")
      @edad = Paciente.age(@paciente.birthdate.to_date)
    end
  end

  # GET /pacientes/1
  # GET /pacientes/1.xml
  def show
    @paciente = Paciente.find(params[:id])
    @clinicalhistories = Clinicalhistory.where(:paciente_id => @paciente).order("assessmentdate DESC")

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
    @tab = Tab.new
    respond_to do |format|
      format.html# new.html.erb
      format.xml  { render :xml => @paciente }
    end
  end

  # GET /pacientes/1/edit
  def edit
    @paciente = Paciente.find_by_id(params[:id])
    @clinicalhistories = Clinicalhistory.where(:paciente_id => @paciente).order("assessmentdate DESC")
    @edad = Paciente.age(@paciente.birthdate.to_date)
  end

  # POST /pacientes
  # POST /pacientes.xml
  def create
    @paciente = Paciente.new(params[:paciente])
    @clinicalhistory = Clinicalhistory.new(params[:clinicalhistory])
    @paciente.clinicalhistories << @clinicalhistory
    @codigo = Countreference.find_by_name('P')
    @codigo.value = @codigo.value + 1
    @codigo.save
    @paciente.codigo = @codigo.value
    
    @codigo = Countreference.find_by_name('C')
    @codigo.value = @codigo.value + 1
    @codigo.save
    @clinicalhistory.code = @codigo.value
    # @clinicalhistory.assessmentdate = @clinicalhistory.assessmentdate.to_date unless @clinicalhistory.assessmentdate.nil?
    # @clinicalhistory.startdatetto = @clinicalhistory.startdatetto.to_date unless @clinicalhistory.startdatetto.nil?
    # @clinicalhistory.enddatetto = @clinicalhistory.enddatetto.to_date unless @clinicalhistory.enddatetto.nil?
    respond_to do |format|
      if @paciente.save
        if @clinicalhistory.save
          flash[:notice] = "Ficha de paciente creada correctamente"
          format.html {redirect_to(pacientes_url)}
          format.xml {head :ok}
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
    #Buscamos 
    @paciente = Paciente.find(params[:id])
    @clinicalhistory = Clinicalhistory.find_by_code(params[:clinicalhistory][:code])
    @duplicado = false
    @duplicado = params[:clinicalhistory][:duplicado]
    
    if @paciente.update_attributes(params[:paciente])
      if @duplicado == "1"
        @clinicalhistory = Clinicalhistory.new(params[:clinicalhistory])
        @codigo = Countreference.find_by_name('C')
        @codigo.value = @codigo.value + 1
        @codigo.save
        @clinicalhistory.code = @codigo.value
        @paciente.clinicalhistories << @clinicalhistory
        respond_to do |format|
          if @clinicalhistory.save
            flash[:notice] = "Se han guardado los cambios"
            format.html {redirect_to :action=>'index'}
            format.xml {head :ok}
          end
        end
      else
        respond_to do |format|
            if @clinicalhistory.update_attributes(params[:clinicalhistory])
              flash[:notice] = "Se han guardado los cambios correctamente"
              format.html {redirect_to :action=>'index'}
              format.xml  { head :ok }
            else
              format.html { render :action => "edit" }
              format.xml  { render :xml => @paciente.errors, :status => :unprocessable_entity }
            end
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
  
  def clear
    @paciente = Paciente.find(params[:id])
    @clinicalhistory = Clinicalhistory.new
    @duplicado = false
  end
end
