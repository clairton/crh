class Participant::Contact::AddressesController < ApplicationController
  # GET /participant/contact/addresses
  # GET /participant/contact/addresses.xml
  def index
    @participant_contact_addresses = Participant::Contact::Address.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @participant_contact_addresses }
    end
  end

  # GET /participant/contact/addresses/1
  # GET /participant/contact/addresses/1.xml
  def show
    @participant_contact_address = Participant::Contact::Address.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @participant_contact_address }
    end
  end

  # GET /participant/contact/addresses/new
  # GET /participant/contact/addresses/new.xml
  def new
    @participant_contact_address = Participant::Contact::Address.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @participant_contact_address }
    end
  end

  # GET /participant/contact/addresses/1/edit
  def edit
    @participant_contact_address = Participant::Contact::Address.find(params[:id])
  end

  # POST /participant/contact/addresses
  # POST /participant/contact/addresses.xml
  def create
    @participant_contact_address = Participant::Contact::Address.new(params[:participant_contact_address])

    respond_to do |format|
      if @participant_contact_address.save
        format.html { redirect_to(@participant_contact_address, :notice => 'Address was successfully created.') }
        format.xml  { render :xml => @participant_contact_address, :status => :created, :location => @participant_contact_address }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @participant_contact_address.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /participant/contact/addresses/1
  # PUT /participant/contact/addresses/1.xml
  def update
    @participant_contact_address = Participant::Contact::Address.find(params[:id])

    respond_to do |format|
      if @participant_contact_address.update_attributes(params[:participant_contact_address])
        format.html { redirect_to(@participant_contact_address, :notice => 'Address was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @participant_contact_address.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /participant/contact/addresses/1
  # DELETE /participant/contact/addresses/1.xml
  def destroy
    @participant_contact_address = Participant::Contact::Address.find(params[:id])
    @participant_contact_address.destroy

    respond_to do |format|
      format.html { redirect_to(participant_contact_addresses_url) }
      format.xml  { head :ok }
    end
  end
end
