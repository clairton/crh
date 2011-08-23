class Participant::ParticipantsController < ApplicationController
  # GET /participant/participants
  # GET /participant/participants.xml
  def index
    @participant_participants = Participant::Participant.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @participant_participants }
    end
  end

  # GET /participant/participants/1
  # GET /participant/participants/1.xml
  def show
    @participant_participant = Participant::Participant.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @participant_participant }
    end
  end

  # GET /participant/participants/new
  # GET /participant/participants/new.xml
  def new
    @participant_participant = Participant::Participant.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @participant_participant }
    end
  end

  # GET /participant/participants/1/edit
  def edit
    @participant_participant = Participant::Participant.find(params[:id])
  end

  # POST /participant/participants
  # POST /participant/participants.xml
  def create
    @participant_participant = Participant::Participant.new(params[:participant_participant])

    respond_to do |format|
      if @participant_participant.save
        format.html { redirect_to(@participant_participant, :notice => 'Participant was successfully created.') }
        format.xml  { render :xml => @participant_participant, :status => :created, :location => @participant_participant }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @participant_participant.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /participant/participants/1
  # PUT /participant/participants/1.xml
  def update
    @participant_participant = Participant::Participant.find(params[:id])

    respond_to do |format|
      if @participant_participant.update_attributes(params[:participant_participant])
        format.html { redirect_to(@participant_participant, :notice => 'Participant was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @participant_participant.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /participant/participants/1
  # DELETE /participant/participants/1.xml
  def destroy
    @participant_participant = Participant::Participant.find(params[:id])
    @participant_participant.destroy

    respond_to do |format|
      format.html { redirect_to(participant_participants_url) }
      format.xml  { head :ok }
    end
  end
end
