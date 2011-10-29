class Goods::Additional::ValuesController < ApplicationController
  before_filter :authenticate_user!, :except =>[:some_action_without_auth]
  # GET /goods/additional/values
  # GET /goods/additional/values.xml
  def index
    @goods_additional_values = Goods::Additional::Value.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @goods_additional_values }
    end
  end

  # GET /goods/additional/values/1
  # GET /goods/additional/values/1.xml
  def show
    @goods_additional_value = Goods::Additional::Value.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @goods_additional_value }
    end
  end

  # GET /goods/additional/values/new
  # GET /goods/additional/values/new.xml
  def new
    @goods_additional_value = Goods::Additional::Value.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @goods_additional_value }
    end
  end

  # GET /goods/additional/values/1/edit
  def edit
    @goods_additional_value = Goods::Additional::Value.find(params[:id])
  end

  # POST /goods/additional/values
  # POST /goods/additional/values.xml
  def create
    @goods_additional_value = Goods::Additional::Value.new(params[:goods_additional_value])

    respond_to do |format|
      if @goods_additional_value.save
        format.html { redirect_to(@goods_additional_value, :notice => 'Value was successfully created.') }
        format.xml  { render :xml => @goods_additional_value, :status => :created, :location => @goods_additional_value }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @goods_additional_value.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /goods/additional/values/1
  # PUT /goods/additional/values/1.xml
  def update
    @goods_additional_value = Goods::Additional::Value.find(params[:id])

    respond_to do |format|
      if @goods_additional_value.update_attributes(params[:goods_additional_value])
        format.html { redirect_to(@goods_additional_value, :notice => 'Value was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @goods_additional_value.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /goods/additional/values/1
  # DELETE /goods/additional/values/1.xml
  def destroy
    @goods_additional_value = Goods::Additional::Value.find(params[:id])
    @goods_additional_value.destroy

    respond_to do |format|
      format.html { redirect_to(goods_additional_values_url) }
      format.xml  { head :ok }
    end
  end
end

