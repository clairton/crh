class Transaction::RecordsController < ApplicationController
  before_filter :authenticate_user!, :except =>[:some_action_without_auth]
  # GET /transaction/records
  # GET /transaction/records.xml
  def index
    @transaction_records = Transaction::Record.all
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

