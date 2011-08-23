class Transaction::Goods::AdditionalsController < ApplicationController
  # GET /transaction/goods/additionals
  # GET /transaction/goods/additionals.xml
  def index
    @transaction_goods_additionals = Transaction::Goods::Additional.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @transaction_goods_additionals }
    end
  end

  # GET /transaction/goods/additionals/1
  # GET /transaction/goods/additionals/1.xml
  def show
    @transaction_goods_additional = Transaction::Goods::Additional.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @transaction_goods_additional }
    end
  end

  # GET /transaction/goods/additionals/new
  # GET /transaction/goods/additionals/new.xml
  def new
    @transaction_goods_additional = Transaction::Goods::Additional.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @transaction_goods_additional }
    end
  end

  # GET /transaction/goods/additionals/1/edit
  def edit
    @transaction_goods_additional = Transaction::Goods::Additional.find(params[:id])
  end

  # POST /transaction/goods/additionals
  # POST /transaction/goods/additionals.xml
  def create
    @transaction_goods_additional = Transaction::Goods::Additional.new(params[:transaction_goods_additional])

    respond_to do |format|
      if @transaction_goods_additional.save
        format.html { redirect_to(@transaction_goods_additional, :notice => 'Additional was successfully created.') }
        format.xml  { render :xml => @transaction_goods_additional, :status => :created, :location => @transaction_goods_additional }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @transaction_goods_additional.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /transaction/goods/additionals/1
  # PUT /transaction/goods/additionals/1.xml
  def update
    @transaction_goods_additional = Transaction::Goods::Additional.find(params[:id])

    respond_to do |format|
      if @transaction_goods_additional.update_attributes(params[:transaction_goods_additional])
        format.html { redirect_to(@transaction_goods_additional, :notice => 'Additional was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @transaction_goods_additional.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /transaction/goods/additionals/1
  # DELETE /transaction/goods/additionals/1.xml
  def destroy
    @transaction_goods_additional = Transaction::Goods::Additional.find(params[:id])
    @transaction_goods_additional.destroy

    respond_to do |format|
      format.html { redirect_to(transaction_goods_additionals_url) }
      format.xml  { head :ok }
    end
  end
end
