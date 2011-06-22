class CentersController < ApplicationController
  # GET /centers
  # GET /centers.xml
  def index
    @centers = Center.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @centers }
    end
  end

  # GET /centers/1
  # GET /centers/1.xml
  def show
    @center = Center.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @center }
    end
  end

  # GET /centers/new
  # GET /centers/new.xml
  def new
    @center = Center.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @center }
    end
  end

  # GET /centers/1/edit
  def edit
    @center = Center.find(params[:id])
  end

  # POST /centers
  # POST /centers.xml
  def create
    @center = Center.new(params[:center])

    respond_to do |format|
      if @center.save
        format.html { redirect_to(@center, :notice => 'Center was successfully created.') }
        format.xml  { render :xml => @center, :status => :created, :location => @center }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @center.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /centers/1
  # PUT /centers/1.xml
  def update
    @center = Center.find(params[:id])

    respond_to do |format|
      if @center.update_attributes(params[:center])
        format.html { redirect_to(@center, :notice => 'Center was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @center.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /centers/1
  # DELETE /centers/1.xml
  def destroy
    @center = Center.find(params[:id])
    @center.destroy

    respond_to do |format|
      format.html { redirect_to(centers_url) }
      format.xml  { head :ok }
    end
  end
end
