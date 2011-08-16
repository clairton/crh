class Goods::ItemsController < ApplicationController
  # GET /goods/items
  # GET /goods/items.xml
  def index
    @goods_items = Goods::Item.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @goods_items }
    end
  end

  # GET /goods/items/1
  # GET /goods/items/1.xml
  def show
    @goods_item = Goods::Item.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @goods_item }
    end
  end

  # GET /goods/items/new
  # GET /goods/items/new.xml
  def new
    @goods_item = Goods::Item.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @goods_item }
    end
  end

  # GET /goods/items/1/edit
  def edit
    @goods_item = Goods::Item.find(params[:id])
  end

  # POST /goods/items
  # POST /goods/items.xml
  def create
    @goods_item = Goods::Item.new(params[:goods_item])

    respond_to do |format|
      if @goods_item.save
        format.html { redirect_to(@goods_item, :notice => 'Item was successfully created.') }
        format.xml  { render :xml => @goods_item, :status => :created, :location => @goods_item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @goods_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /goods/items/1
  # PUT /goods/items/1.xml
  def update
    @goods_item = Goods::Item.find(params[:id])

    respond_to do |format|
      if @goods_item.update_attributes(params[:goods_item])
        format.html { redirect_to(@goods_item, :notice => 'Item was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @goods_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /goods/items/1
  # DELETE /goods/items/1.xml
  def destroy
    @goods_item = Goods::Item.find(params[:id])
    @goods_item.destroy

    respond_to do |format|
      format.html { redirect_to(goods_items_url) }
      format.xml  { head :ok }
    end
  end
end
