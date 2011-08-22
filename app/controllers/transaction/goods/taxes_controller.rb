class Transaction::Goods::TaxesController < ApplicationController
  # GET /transaction/goods/taxes
  # GET /transaction/goods/taxes.xml
  def index
    @transaction_goods_taxes = Transaction::Goods::Taxe.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @transaction_goods_taxes }
    end
  end

  # GET /transaction/goods/taxes/1
  # GET /transaction/goods/taxes/1.xml
  def show
    @transaction_goods_taxis = Transaction::Goods::Taxe.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @transaction_goods_taxis }
    end
  end

  # GET /transaction/goods/taxes/new
  # GET /transaction/goods/taxes/new.xml
  def new
    @transaction_goods_taxis = Transaction::Goods::Taxe.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @transaction_goods_taxis }
    end
  end

  # GET /transaction/goods/taxes/1/edit
  def edit
    @transaction_goods_taxis = Transaction::Goods::Taxe.find(params[:id])
  end

  # POST /transaction/goods/taxes
  # POST /transaction/goods/taxes.xml
  def create
    @transaction_goods_taxis = Transaction::Goods::Taxe.new(params[:transaction_goods_taxis])

    respond_to do |format|
      if @transaction_goods_taxis.save
        format.html { redirect_to(@transaction_goods_taxis, :notice => 'Taxe was successfully created.') }
        format.xml  { render :xml => @transaction_goods_taxis, :status => :created, :location => @transaction_goods_taxis }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @transaction_goods_taxis.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /transaction/goods/taxes/1
  # PUT /transaction/goods/taxes/1.xml
  def update
    @transaction_goods_taxis = Transaction::Goods::Taxe.find(params[:id])

    respond_to do |format|
      if @transaction_goods_taxis.update_attributes(params[:transaction_goods_taxis])
        format.html { redirect_to(@transaction_goods_taxis, :notice => 'Taxe was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @transaction_goods_taxis.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /transaction/goods/taxes/1
  # DELETE /transaction/goods/taxes/1.xml
  def destroy
    @transaction_goods_taxis = Transaction::Goods::Taxe.find(params[:id])
    @transaction_goods_taxis.destroy

    respond_to do |format|
      format.html { redirect_to(transaction_goods_taxes_url) }
      format.xml  { head :ok }
    end
  end
end
