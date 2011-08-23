class Transaction::Record::TotsController < ApplicationController
  # GET /transaction/record/tots
  # GET /transaction/record/tots.xml
  def index
    @transaction_record_tots = Transaction::Record::Tot.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @transaction_record_tots }
    end
  end

  # GET /transaction/record/tots/1
  # GET /transaction/record/tots/1.xml
  def show
    @transaction_record_tot = Transaction::Record::Tot.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @transaction_record_tot }
    end
  end

  # GET /transaction/record/tots/new
  # GET /transaction/record/tots/new.xml
  def new
    @transaction_record_tot = Transaction::Record::Tot.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @transaction_record_tot }
    end
  end

  # GET /transaction/record/tots/1/edit
  def edit
    @transaction_record_tot = Transaction::Record::Tot.find(params[:id])
  end

  # POST /transaction/record/tots
  # POST /transaction/record/tots.xml
  def create
    @transaction_record_tot = Transaction::Record::Tot.new(params[:transaction_record_tot])

    respond_to do |format|
      if @transaction_record_tot.save
        format.html { redirect_to(@transaction_record_tot, :notice => 'Tot was successfully created.') }
        format.xml  { render :xml => @transaction_record_tot, :status => :created, :location => @transaction_record_tot }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @transaction_record_tot.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /transaction/record/tots/1
  # PUT /transaction/record/tots/1.xml
  def update
    @transaction_record_tot = Transaction::Record::Tot.find(params[:id])

    respond_to do |format|
      if @transaction_record_tot.update_attributes(params[:transaction_record_tot])
        format.html { redirect_to(@transaction_record_tot, :notice => 'Tot was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @transaction_record_tot.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /transaction/record/tots/1
  # DELETE /transaction/record/tots/1.xml
  def destroy
    @transaction_record_tot = Transaction::Record::Tot.find(params[:id])
    @transaction_record_tot.destroy

    respond_to do |format|
      format.html { redirect_to(transaction_record_tots_url) }
      format.xml  { head :ok }
    end
  end
end
