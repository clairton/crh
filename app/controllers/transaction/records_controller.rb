class Transaction::RecordsController < ApplicationController
  # GET /transaction/records
  # GET /transaction/records.xml
  def index
    @transaction_records = Transaction::Record.all
    #@transaction_records.tot
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @transaction_records }
    end
  end

  # GET /transaction/records/1
  # GET /transaction/records/1.xml
  def show
    @transaction_record = Transaction::Record.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @transaction_record }
    end
  end


  def filter
    respond_to do |format|
      format.html # filter.html.erb
      format.xml  { render :xml => @transaction_records }
    end
  end
  
  def report
    start_date = Date.civil(params[:start_date][:year].to_i, params[:start_date][:month].to_i, params[:start_date][:day].to_i)
    end_date = Date.civil(params[:end_date][:year].to_i, params[:end_date][:month].to_i, params[:end_date][:day].to_i)
    @transaction_records = Transaction::Record.all(
      :conditions => {
        "transaction_records.creation_date >= #{start_date}",
        "transaction_records.creation_date <= #{end_date}"
      }
    )
    respond_to do |format|
      format.html # report.html.erb
      format.xml  { render :xml => @transaction_record }
    end
  end

  # GET /transaction/records/new
  # GET /transaction/records/new.xml
  def new
    @transaction_record = Transaction::Record.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @transaction_record }
    end
  end

  # GET /transaction/records/1/edit
  def edit
    @transaction_record = Transaction::Record.find(params[:id])
  end

  # POST /transaction/records
  # POST /transaction/records.xml
  def create
    @transaction_record = Transaction::Record.new(params[:transaction_record])

    respond_to do |format|
      if @transaction_record.save
        format.html { redirect_to(@transaction_record, :notice => 'Record was successfully created.') }
        format.xml  { render :xml => @transaction_record, :status => :created, :location => @transaction_record }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @transaction_record.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /transaction/records/1
  # PUT /transaction/records/1.xml
  def update
    @transaction_record = Transaction::Record.find(params[:id])

    respond_to do |format|
      if @transaction_record.update_attributes(params[:transaction_record])
        format.html { redirect_to(@transaction_record, :notice => 'Record was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @transaction_record.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /transaction/records/1
  # DELETE /transaction/records/1.xml
  def destroy
    @transaction_record = Transaction::Record.find(params[:id])
    @transaction_record.destroy

    respond_to do |format|
      format.html { redirect_to(transaction_records_url) }
      format.xml  { head :ok }
    end
  end
end
