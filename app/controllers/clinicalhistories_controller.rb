class ClinicalhistoriesController < ApplicationController
  # GET /clinicalhistories
  # GET /clinicalhistories.xml
  def index
    @clinicalhistories = Clinicalhistory.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @clinicalhistories }
    end
  end

  # GET /clinicalhistories/1
  # GET /clinicalhistories/1.xml
  def show
    @clinicalhistory = Clinicalhistory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @clinicalhistory }
    end
  end

  # GET /clinicalhistories/new
  # GET /clinicalhistories/new.xml
  def new
    @clinicalhistory = Clinicalhistory.new

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
        format.html { redirect_to(@clinicalhistory, :notice => 'Clinicalhistory was successfully created.') }
        format.xml  { render :xml => @clinicalhistory, :status => :created, :location => @clinicalhistory }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @clinicalhistory.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /clinicalhistories/1
  # PUT /clinicalhistories/1.xml
  def update
    @clinicalhistory = Clinicalhistory.find(params[:id])

    respond_to do |format|
      if @clinicalhistory.update_attributes(params[:clinicalhistory])
        format.html { redirect_to(@clinicalhistory, :notice => 'Clinicalhistory was successfully updated.') }
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
