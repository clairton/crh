class Transaction::ItemTaxesController < ApplicationController
  # GET /transaction/item_taxes
  # GET /transaction/item_taxes.xml
  def index
    @transaction_item_taxes = Transaction::ItemTaxe.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @transaction_item_taxes }
    end
  end

  # GET /transaction/item_taxes/1
  # GET /transaction/item_taxes/1.xml
  def show
    @transaction_item_taxis = Transaction::ItemTaxe.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @transaction_item_taxis }
    end
  end

  # GET /transaction/item_taxes/new
  # GET /transaction/item_taxes/new.xml
  def new
    @transaction_item_taxis = Transaction::ItemTaxe.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @transaction_item_taxis }
    end
  end

  # GET /transaction/item_taxes/1/edit
  def edit
    @transaction_item_taxis = Transaction::ItemTaxe.find(params[:id])
  end

  # POST /transaction/item_taxes
  # POST /transaction/item_taxes.xml
  def create
    @transaction_item_taxis = Transaction::ItemTaxe.new(params[:transaction_item_taxis])

    respond_to do |format|
      if @transaction_item_taxis.save
        format.html { redirect_to(@transaction_item_taxis, :notice => 'Item taxe was successfully created.') }
        format.xml  { render :xml => @transaction_item_taxis, :status => :created, :location => @transaction_item_taxis }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @transaction_item_taxis.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /transaction/item_taxes/1
  # PUT /transaction/item_taxes/1.xml
  def update
    @transaction_item_taxis = Transaction::ItemTaxe.find(params[:id])

    respond_to do |format|
      if @transaction_item_taxis.update_attributes(params[:transaction_item_taxis])
        format.html { redirect_to(@transaction_item_taxis, :notice => 'Item taxe was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @transaction_item_taxis.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /transaction/item_taxes/1
  # DELETE /transaction/item_taxes/1.xml
  def destroy
    @transaction_item_taxis = Transaction::ItemTaxe.find(params[:id])
    @transaction_item_taxis.destroy

    respond_to do |format|
      format.html { redirect_to(transaction_item_taxes_url) }
      format.xml  { head :ok }
    end
  end
end
