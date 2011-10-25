class Address::placesController < ApplicationController
  before_filter :authenticate_user!, :except =>[:some_action_without_auth]
  # GET /address/places
  # GET /address/places.xml
  def index
    @address_places = Address::place.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @address_places }
    end
  end

  # GET /address/places/1
  # GET /address/places/1.xml
  def show
    @address_place = Address::place.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @address_place }
    end
  end

  # GET /address/places/new
  # GET /address/places/new.xml
  def new
    @address_place = Address::place.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @address_place }
    end
  end

  # GET /address/places/1/edit
  def edit
    @address_place = Address::place.find(params[:id])
  end

  # POST /address/places
  # POST /address/places.xml
  def create
    @address_place = Address::place.new(params[:address_place])

    respond_to do |format|
      if @address_place.save
        format.html { redirect_to(@address_place, :notice => 'Place was successfully created.') }
        format.xml  { render :xml => @address_place, :status => :created, :location => @address_place }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @address_place.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /address/places/1
  # PUT /address/places/1.xml
  def update
    @address_place = Address::place.find(params[:id])

    respond_to do |format|
      if @address_place.update_attributes(params[:address_place])
        format.html { redirect_to(@address_place, :notice => 'Place was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @address_place.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /address/places/1
  # DELETE /address/places/1.xml
  def destroy
    @address_place = Address::place.find(params[:id])
    @address_place.destroy

    respond_to do |format|
      format.html { redirect_to(address_places_url) }
      format.xml  { head :ok }
    end
  end
end
