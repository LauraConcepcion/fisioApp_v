class InvoiceheadsController < ApplicationController
  # GET /invoiceheads
  # GET /invoiceheads.xml
  def index
    @invoiceheads = Events.where(:id => params[:id])
    
    @events = Event.where(:paciente_id=>params[:search])
    @clinicalhistories = Clinicalhistory.where(:paciente_id => params[:search]).order("assessmentdate DESC")
    @clinicalhistory = @clinicalhistories.first
    @invoiceline = Invoiceline.new
    @search = Invoiceline.all
    @events.size.times do |i|
      @invoiceline.linenumber = i
      @invoiceline.concept = @events[i].description
      @invoiceline.price = @clinicalhistory.rate.rate
      @invoiceline.sessions = 1
      @invoiceline.total = @invoiceline.price*@invoiceline.sessions 
       
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @invoiceheads }
    end
  end

  # GET /invoiceheads/1
  # GET /invoiceheads/1.xml
  def show
    @invoicehead = Invoicehead.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @invoicehead }
    end
  end

  # GET /invoiceheads/new
  # GET /invoiceheads/new.xml
  def new
    @invoicehead = Invoicehead.new
    2.times do
       @invoicehead.invoicelines.build
    end
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @invoicehead }
    end
  end

  # GET /invoiceheads/1/edit
  def edit
    @invoicehead = Invoicehead.find(params[:id])
  end

  # POST /invoiceheads
  # POST /invoiceheads.xml
  def create
    @invoicehead = Invoicehead.new(params[:invoicehead])
    
    respond_to do |format|
      if @invoicehead.save
        format.html { redirect_to(@invoicehead, :notice => 'Invoicehead was successfully created.') }
        format.xml  { render :xml => @invoicehead, :status => :created, :location => @invoicehead }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @invoicehead.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /invoiceheads/1
  # PUT /invoiceheads/1.xml
  def update
    @invoicehead = Invoicehead.find(params[:id])

    respond_to do |format|
      if @invoicehead.update_attributes(params[:invoicehead])
        format.html { redirect_to(@invoicehead, :notice => 'Invoicehead was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @invoicehead.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /invoiceheads/1
  # DELETE /invoiceheads/1.xml
  def destroy
    @invoicehead = Invoicehead.find(params[:id])
    @invoicehead.destroy

    respond_to do |format|
      format.html { redirect_to(invoiceheads_url) }
      format.xml  { head :ok }
    end
  end
end
