class Transaction::TaxesController < ApplicationController
  # GET /transaction/taxes
  # GET /transaction/taxes.xml
  def index
    @transaction_taxes = Transaction::Taxe.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @transaction_taxes }
    end
  end

  # GET /transaction/taxes/1
  # GET /transaction/taxes/1.xml
  def show
    @transaction_taxis = Transaction::Taxe.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @transaction_taxis }
    end
  end

  # GET /transaction/taxes/new
  # GET /transaction/taxes/new.xml
  def new
    @transaction_taxis = Transaction::Taxe.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @transaction_taxis }
    end
  end

  # GET /transaction/taxes/1/edit
  def edit
    @transaction_taxis = Transaction::Taxe.find(params[:id])
  end

  # POST /transaction/taxes
  # POST /transaction/taxes.xml
  def create
    @transaction_taxis = Transaction::Taxe.new(params[:transaction_taxis])

    respond_to do |format|
      if @transaction_taxis.save
        format.html { redirect_to(@transaction_taxis, :notice => 'Taxe was successfully created.') }
        format.xml  { render :xml => @transaction_taxis, :status => :created, :location => @transaction_taxis }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @transaction_taxis.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /transaction/taxes/1
  # PUT /transaction/taxes/1.xml
  def update
    @transaction_taxis = Transaction::Taxe.find(params[:id])

    respond_to do |format|
      if @transaction_taxis.update_attributes(params[:transaction_taxis])
        format.html { redirect_to(@transaction_taxis, :notice => 'Taxe was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @transaction_taxis.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /transaction/taxes/1
  # DELETE /transaction/taxes/1.xml
  def destroy
    @transaction_taxis = Transaction::Taxe.find(params[:id])
    @transaction_taxis.destroy

    respond_to do |format|
      format.html { redirect_to(transaction_taxes_url) }
      format.xml  { head :ok }
    end
  end
end
