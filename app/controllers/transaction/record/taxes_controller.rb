class Transaction::Record::TaxesController < ApplicationController
  # GET /transaction/record/taxes
  # GET /transaction/record/taxes.xml
  def index
    @transaction_record_taxes = Transaction::Record::Taxe.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @transaction_record_taxes }
    end
  end

  # GET /transaction/record/taxes/1
  # GET /transaction/record/taxes/1.xml
  def show
    @transaction_record_taxis = Transaction::Record::Taxe.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @transaction_record_taxis }
    end
  end

  # GET /transaction/record/taxes/new
  # GET /transaction/record/taxes/new.xml
  def new
    @transaction_record_taxis = Transaction::Record::Taxe.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @transaction_record_taxis }
    end
  end

  # GET /transaction/record/taxes/1/edit
  def edit
    @transaction_record_taxis = Transaction::Record::Taxe.find(params[:id])
  end

  # POST /transaction/record/taxes
  # POST /transaction/record/taxes.xml
  def create
    @transaction_record_taxis = Transaction::Record::Taxe.new(params[:transaction_record_taxis])

    respond_to do |format|
      if @transaction_record_taxis.save
        format.html { redirect_to(@transaction_record_taxis, :notice => 'Taxe was successfully created.') }
        format.xml  { render :xml => @transaction_record_taxis, :status => :created, :location => @transaction_record_taxis }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @transaction_record_taxis.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /transaction/record/taxes/1
  # PUT /transaction/record/taxes/1.xml
  def update
    @transaction_record_taxis = Transaction::Record::Taxe.find(params[:id])

    respond_to do |format|
      if @transaction_record_taxis.update_attributes(params[:transaction_record_taxis])
        format.html { redirect_to(@transaction_record_taxis, :notice => 'Taxe was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @transaction_record_taxis.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /transaction/record/taxes/1
  # DELETE /transaction/record/taxes/1.xml
  def destroy
    @transaction_record_taxis = Transaction::Record::Taxe.find(params[:id])
    @transaction_record_taxis.destroy

    respond_to do |format|
      format.html { redirect_to(transaction_record_taxes_url) }
      format.xml  { head :ok }
    end
  end
end
