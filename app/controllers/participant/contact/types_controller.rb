class Participant::Contact::TypesController < ApplicationController
  before_filter :authenticate_user!, :except =>[:some_action_without_auth]
  # GET /participant/contact/types
  # GET /participant/contact/types.xml
  def index
    @participant_contact_types = Participant::Contact::Type.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @participant_contact_types }
    end
  end

  # GET /participant/contact/types/1
  # GET /participant/contact/types/1.xml
  def show
    @participant_contact_type = Participant::Contact::Type.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @participant_contact_type }
    end
  end

  # GET /participant/contact/types/new
  # GET /participant/contact/types/new.xml
  def new
    @participant_contact_type = Participant::Contact::Type.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @participant_contact_type }
    end
  end

  # GET /participant/contact/types/1/edit
  def edit
    @participant_contact_type = Participant::Contact::Type.find(params[:id])
  end

  # POST /participant/contact/types
  # POST /participant/contact/types.xml
  def create
    @participant_contact_type = Participant::Contact::Type.new(params[:participant_contact_type])

    respond_to do |format|
      if @participant_contact_type.save
        format.html { redirect_to(@participant_contact_type, :notice => 'Type was successfully created.') }
        format.xml  { render :xml => @participant_contact_type, :status => :created, :location => @participant_contact_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @participant_contact_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /participant/contact/types/1
  # PUT /participant/contact/types/1.xml
  def update
    @participant_contact_type = Participant::Contact::Type.find(params[:id])

    respond_to do |format|
      if @participant_contact_type.update_attributes(params[:participant_contact_type])
        format.html { redirect_to(@participant_contact_type, :notice => 'Type was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @participant_contact_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /participant/contact/types/1
  # DELETE /participant/contact/types/1.xml
  def destroy
    @participant_contact_type = Participant::Contact::Type.find(params[:id])
    @participant_contact_type.destroy

    respond_to do |format|
      format.html { redirect_to(participant_contact_types_url) }
      format.xml  { head :ok }
    end
  end
end
