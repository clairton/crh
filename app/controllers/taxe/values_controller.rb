class Taxe::ValuesController < ApplicationController
  before_filter :authenticate_user!, :except =>[:some_action_without_auth]
  # GET /taxe/values
  # GET /taxe/values.xml
  def index
    @taxe_values = Taxe::Value.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @taxe_values }
    end
  end

  # GET /taxe/values/1
  # GET /taxe/values/1.xml
  def show
    @taxe_value = Taxe::Value.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @taxe_value }
    end
  end

  # GET /taxe/values/new
  # GET /taxe/values/new.xml
  def new
    @taxe_value = Taxe::Value.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @taxe_value }
    end
  end

  # GET /taxe/values/1/edit
  def edit
    @taxe_value = Taxe::Value.find(params[:id])
  end

  # POST /taxe/values
  # POST /taxe/values.xml
  def create
    @taxe_value = Taxe::Value.new(params[:taxe_value])

    respond_to do |format|
      if @taxe_value.save
        format.html { redirect_to(@taxe_value, :notice => 'Value was successfully created.') }
        format.xml  { render :xml => @taxe_value, :status => :created, :location => @taxe_value }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @taxe_value.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /taxe/values/1
  # PUT /taxe/values/1.xml
  def update
    @taxe_value = Taxe::Value.find(params[:id])

    respond_to do |format|
      if @taxe_value.update_attributes(params[:taxe_value])
        format.html { redirect_to(@taxe_value, :notice => 'Value was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @taxe_value.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /taxe/values/1
  # DELETE /taxe/values/1.xml
  def destroy
    @taxe_value = Taxe::Value.find(params[:id])
    @taxe_value.destroy

    respond_to do |format|
      format.html { redirect_to(taxe_values_url) }
      format.xml  { head :ok }
    end
  end
end
