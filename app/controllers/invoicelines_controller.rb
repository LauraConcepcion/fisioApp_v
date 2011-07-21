class InvoicelinesController < ApplicationController
  # GET /invoicelines
  # GET /invoicelines.xml
  def index
    @invoicelines = Invoiceline.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @invoicelines }
    end
  end

  # GET /invoicelines/1
  # GET /invoicelines/1.xml
  def show
    @invoiceline = Invoiceline.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @invoiceline }
    end
  end

  # GET /invoicelines/new
  # GET /invoicelines/new.xml
  def new
    @invoiceline = Invoiceline.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @invoiceline }
    end
  end

  # GET /invoicelines/1/edit
  def edit
    @invoiceline = Invoiceline.find(params[:id])
  end

  # POST /invoicelines
  # POST /invoicelines.xml
  def create
    @invoiceline = Invoiceline.new(params[:invoiceline])

    respond_to do |format|
      if @invoiceline.save
        format.html { redirect_to(@invoiceline, :notice => 'Invoiceline was successfully created.') }
        format.xml  { render :xml => @invoiceline, :status => :created, :location => @invoiceline }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @invoiceline.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /invoicelines/1
  # PUT /invoicelines/1.xml
  def update
    @invoiceline = Invoiceline.find(params[:id])

    respond_to do |format|
      if @invoiceline.update_attributes(params[:invoiceline])
        format.html { redirect_to(@invoiceline, :notice => 'Invoiceline was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @invoiceline.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /invoicelines/1
  # DELETE /invoicelines/1.xml
  def destroy
    @invoiceline = Invoiceline.find(params[:id])
    @invoiceline.destroy

    respond_to do |format|
      format.html { redirect_to(invoicelines_url) }
      format.xml  { head :ok }
    end
  end
end
