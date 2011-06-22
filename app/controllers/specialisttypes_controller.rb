class SpecialisttypesController < ApplicationController
  # GET /specialisttypes
  # GET /specialisttypes.xml
  def index
    @specialisttypes = Specialisttype.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @specialisttypes }
    end
  end

  # GET /specialisttypes/1
  # GET /specialisttypes/1.xml
  def show
    @specialisttype = Specialisttype.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @specialisttype }
    end
  end

  # GET /specialisttypes/new
  # GET /specialisttypes/new.xml
  def new
    @specialisttype = Specialisttype.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @specialisttype }
    end
  end

  # GET /specialisttypes/1/edit
  def edit
    @specialisttype = Specialisttype.find(params[:id])
  end

  # POST /specialisttypes
  # POST /specialisttypes.xml
  def create
    @specialisttype = Specialisttype.new(params[:specialisttype])

    respond_to do |format|
      if @specialisttype.save
        format.html { redirect_to(@specialisttype, :notice => 'Specialisttype was successfully created.') }
        format.xml  { render :xml => @specialisttype, :status => :created, :location => @specialisttype }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @specialisttype.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /specialisttypes/1
  # PUT /specialisttypes/1.xml
  def update
    @specialisttype = Specialisttype.find(params[:id])

    respond_to do |format|
      if @specialisttype.update_attributes(params[:specialisttype])
        format.html { redirect_to(@specialisttype, :notice => 'Specialisttype was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @specialisttype.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /specialisttypes/1
  # DELETE /specialisttypes/1.xml
  def destroy
    @specialisttype = Specialisttype.find(params[:id])
    @specialisttype.destroy

    respond_to do |format|
      format.html { redirect_to(specialisttypes_url) }
      format.xml  { head :ok }
    end
  end
end
