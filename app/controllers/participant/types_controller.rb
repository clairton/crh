class Participant::TypesController < ApplicationController
  before_filter :authenticate_user!, :except =>[:some_action_without_auth]
  # GET /participant/types
  # GET /participant/types.xml
  def index
    @participant_types = Participant::Type.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @participant_types }
    end
  end

  # GET /participant/types/1
  # GET /participant/types/1.xml
  def show
    @participant_type = Participant::Type.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @participant_type }
    end
  end

  # GET /participant/types/new
  # GET /participant/types/new.xml
  def new
    @participant_type = Participant::Type.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @participant_type }
    end
  end

  # GET /participant/types/1/edit
  def edit
    @participant_type = Participant::Type.find(params[:id])
  end

  # POST /participant/types
  # POST /participant/types.xml
  def create
    @participant_type = Participant::Type.new(params[:participant_type])

    respond_to do |format|
      if @participant_type.save
        format.html { redirect_to(@participant_type, :notice => 'Type was successfully created.') }
        format.xml  { render :xml => @participant_type, :status => :created, :location => @participant_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @participant_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /participant/types/1
  # PUT /participant/types/1.xml
  def update
    @participant_type = Participant::Type.find(params[:id])

    respond_to do |format|
      if @participant_type.update_attributes(params[:participant_type])
        format.html { redirect_to(@participant_type, :notice => 'Type was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @participant_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /participant/types/1
  # DELETE /participant/types/1.xml
  def destroy
    @participant_type = Participant::Type.find(params[:id])
    @participant_type.destroy

    respond_to do |format|
      format.html { redirect_to(participant_types_url) }
      format.xml  { head :ok }
    end
  end
end
