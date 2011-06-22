class SpecialistsController < ApplicationController
  # GET /specialists
  # GET /specialists.xml
  def index
    @specialists = Specialist.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @specialists }
    end
  end

  # GET /specialists/1
  # GET /specialists/1.xml
  def show
    @specialist = Specialist.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @specialist }
    end
  end

  # GET /specialists/new
  # GET /specialists/new.xml
  def new
    @specialist = Specialist.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @specialist }
    end
  end

  # GET /specialists/1/edit
  def edit
    @specialist = Specialist.find(params[:id])
  end

  # POST /specialists
  # POST /specialists.xml
  def create
    @specialist = Specialist.new(params[:specialist])

    respond_to do |format|
      if @specialist.save
        format.html { redirect_to(@specialist, :notice => 'Specialist was successfully created.') }
        format.xml  { render :xml => @specialist, :status => :created, :location => @specialist }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @specialist.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /specialists/1
  # PUT /specialists/1.xml
  def update
    @specialist = Specialist.find(params[:id])

    respond_to do |format|
      if @specialist.update_attributes(params[:specialist])
        format.html { redirect_to(@specialist, :notice => 'Specialist was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @specialist.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /specialists/1
  # DELETE /specialists/1.xml
  def destroy
    @specialist = Specialist.find(params[:id])
    @specialist.destroy

    respond_to do |format|
      format.html { redirect_to(specialists_url) }
      format.xml  { head :ok }
    end
  end
end
