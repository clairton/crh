class Transaction::Goods::ItemsController < ApplicationController
  before_filter :authenticate_user!, :except =>[:some_action_without_auth]
  # GET /transaction/goods/items
  # GET /transaction/goods/items.xml
  def index
    @transaction_goods_items = Transaction::Goods::Item.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @transaction_goods_items }
    end
  end

  # GET /transaction/goods/items/1
  # GET /transaction/goods/items/1.xml
  def show
    @transaction_goods_item = Transaction::Goods::Item.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @transaction_goods_item }
    end
  end

  # GET /transaction/goods/items/new
  # GET /transaction/goods/items/new.xml
  def new
    @transaction_goods_item = Transaction::Goods::Item.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @transaction_goods_item }
    end
  end

  # GET /transaction/goods/items/1/edit
  def edit
    @transaction_goods_item = Transaction::Goods::Item.find(params[:id])
  end

  # POST /transaction/goods/items
  # POST /transaction/goods/items.xml
  def create
    @transaction_goods_item = Transaction::Goods::Item.new(params[:transaction_goods_item])

    respond_to do |format|
      if @transaction_goods_item.save
        format.html { redirect_to(@transaction_goods_item, :notice => 'Item was successfully created.') }
        format.xml  { render :xml => @transaction_goods_item, :status => :created, :location => @transaction_goods_item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @transaction_goods_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /transaction/goods/items/1
  # PUT /transaction/goods/items/1.xml
  def update
    @transaction_goods_item = Transaction::Goods::Item.find(params[:id])

    respond_to do |format|
      if @transaction_goods_item.update_attributes(params[:transaction_goods_item])
        format.html { redirect_to(@transaction_goods_item, :notice => 'Item was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @transaction_goods_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /transaction/goods/items/1
  # DELETE /transaction/goods/items/1.xml
  def destroy
    @transaction_goods_item = Transaction::Goods::Item.find(params[:id])
    @transaction_goods_item.destroy

    respond_to do |format|
      format.html { redirect_to(transaction_goods_items_url) }
      format.xml  { head :ok }
    end
  end
end
