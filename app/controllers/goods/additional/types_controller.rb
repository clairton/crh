class Goods::Additional::TypesController < ApplicationController
  before_filter :authenticate_user!, :except =>[:some_action_without_auth]
  # GET /goods/additional/types
  # GET /goods/additional/types.xml
  def index
    @goods_additional_types = Goods::Additional::Type.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @goods_additional_types }
    end
  end

  # GET /goods/additional/types/1
  # GET /goods/additional/types/1.xml
  def show
    @goods_additional_type = Goods::Additional::Type.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @goods_additional_type }
    end
  end

  # GET /goods/additional/types/new
  # GET /goods/additional/types/new.xml
  def new
    @goods_additional_type = Goods::Additional::Type.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @goods_additional_type }
    end
  end

  # GET /goods/additional/types/1/edit
  def edit
    @goods_additional_type = Goods::Additional::Type.find(params[:id])
  end

  # POST /goods/additional/types
  # POST /goods/additional/types.xml
  def create
    @goods_additional_type = Goods::Additional::Type.new(params[:goods_additional_type])

    respond_to do |format|
      if @goods_additional_type.save
        format.html { redirect_to(@goods_additional_type, :notice => 'Type was successfully created.') }
        format.xml  { render :xml => @goods_additional_type, :status => :created, :location => @goods_additional_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @goods_additional_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /goods/additional/types/1
  # PUT /goods/additional/types/1.xml
  def update
    @goods_additional_type = Goods::Additional::Type.find(params[:id])

    respond_to do |format|
      if @goods_additional_type.update_attributes(params[:goods_additional_type])
        format.html { redirect_to(@goods_additional_type, :notice => 'Type was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @goods_additional_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /goods/additional/types/1
  # DELETE /goods/additional/types/1.xml
  def destroy
    @goods_additional_type = Goods::Additional::Type.find(params[:id])
    @goods_additional_type.destroy

    respond_to do |format|
      format.html { redirect_to(goods_additional_types_url) }
      format.xml  { head :ok }
    end
  end
end

