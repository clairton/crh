class Transaction::FinanciersController < ApplicationController
  # GET /transaction/financiers
  # GET /transaction/financiers.xml
  def index
    @transaction_financiers = Transaction::Financier.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @transaction_financiers }
    end
  end

  # GET /transaction/financiers/1
  # GET /transaction/financiers/1.xml
  def show
    @transaction_financier = Transaction::Financier.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @transaction_financier }
    end
  end

  # GET /transaction/financiers/new
  # GET /transaction/financiers/new.xml
  def new
    @transaction_financier = Transaction::Financier.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @transaction_financier }
    end
  end

  # GET /transaction/financiers/1/edit
  def edit
    @transaction_financier = Transaction::Financier.find(params[:id])
  end

  # POST /transaction/financiers
  # POST /transaction/financiers.xml
  def create
    @transaction_financier = Transaction::Financier.new(params[:transaction_financier])

    respond_to do |format|
      if @transaction_financier.save
        format.html { redirect_to(@transaction_financier, :notice => 'Financier was successfully created.') }
        format.xml  { render :xml => @transaction_financier, :status => :created, :location => @transaction_financier }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @transaction_financier.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /transaction/financiers/1
  # PUT /transaction/financiers/1.xml
  def update
    @transaction_financier = Transaction::Financier.find(params[:id])

    respond_to do |format|
      if @transaction_financier.update_attributes(params[:transaction_financier])
        format.html { redirect_to(@transaction_financier, :notice => 'Financier was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @transaction_financier.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /transaction/financiers/1
  # DELETE /transaction/financiers/1.xml
  def destroy
    @transaction_financier = Transaction::Financier.find(params[:id])
    @transaction_financier.destroy

    respond_to do |format|
      format.html { redirect_to(transaction_financiers_url) }
      format.xml  { head :ok }
    end
  end
end
