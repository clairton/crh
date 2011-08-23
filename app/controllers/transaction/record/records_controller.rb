class Transaction::Record::RecordsController < ApplicationController
  # GET /transaction/record/records
  # GET /transaction/record/records.xml
  def index
    @transaction_record_records = Transaction::Record::Record.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @transaction_record_records }
    end
  end

  # GET /transaction/record/records/1
  # GET /transaction/record/records/1.xml
  def show
    @transaction_record_record = Transaction::Record::Record.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @transaction_record_record }
    end
  end

  # GET /transaction/record/records/new
  # GET /transaction/record/records/new.xml
  def new
    @transaction_record_record = Transaction::Record::Record.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @transaction_record_record }
    end
  end

  # GET /transaction/record/records/1/edit
  def edit
    @transaction_record_record = Transaction::Record::Record.find(params[:id])
  end

  # POST /transaction/record/records
  # POST /transaction/record/records.xml
  def create
    @transaction_record_record = Transaction::Record::Record.new(params[:transaction_record_record])

    respond_to do |format|
      if @transaction_record_record.save
        format.html { redirect_to(@transaction_record_record, :notice => 'Record was successfully created.') }
        format.xml  { render :xml => @transaction_record_record, :status => :created, :location => @transaction_record_record }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @transaction_record_record.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /transaction/record/records/1
  # PUT /transaction/record/records/1.xml
  def update
    @transaction_record_record = Transaction::Record::Record.find(params[:id])

    respond_to do |format|
      if @transaction_record_record.update_attributes(params[:transaction_record_record])
        format.html { redirect_to(@transaction_record_record, :notice => 'Record was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @transaction_record_record.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /transaction/record/records/1
  # DELETE /transaction/record/records/1.xml
  def destroy
    @transaction_record_record = Transaction::Record::Record.find(params[:id])
    @transaction_record_record.destroy

    respond_to do |format|
      format.html { redirect_to(transaction_record_records_url) }
      format.xml  { head :ok }
    end
  end
end
