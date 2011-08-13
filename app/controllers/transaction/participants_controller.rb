class Transaction::ParticipantsController < ApplicationController
  # GET /transaction/participants
  # GET /transaction/participants.xml
  def index
    @transaction_participants = Transaction::Participant.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @transaction_participants }
    end
  end

  # GET /transaction/participants/1
  # GET /transaction/participants/1.xml
  def show
    @transaction_participant = Transaction::Participant.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @transaction_participant }
    end
  end

  # GET /transaction/participants/new
  # GET /transaction/participants/new.xml
  def new
    @transaction_participant = Transaction::Participant.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @transaction_participant }
    end
  end

  # GET /transaction/participants/1/edit
  def edit
    @transaction_participant = Transaction::Participant.find(params[:id])
  end

  # POST /transaction/participants
  # POST /transaction/participants.xml
  def create
    @transaction_participant = Transaction::Participant.new(params[:transaction_participant])

    respond_to do |format|
      if @transaction_participant.save
        format.html { redirect_to(@transaction_participant, :notice => 'Participant was successfully created.') }
        format.xml  { render :xml => @transaction_participant, :status => :created, :location => @transaction_participant }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @transaction_participant.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /transaction/participants/1
  # PUT /transaction/participants/1.xml
  def update
    @transaction_participant = Transaction::Participant.find(params[:id])

    respond_to do |format|
      if @transaction_participant.update_attributes(params[:transaction_participant])
        format.html { redirect_to(@transaction_participant, :notice => 'Participant was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @transaction_participant.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /transaction/participants/1
  # DELETE /transaction/participants/1.xml
  def destroy
    @transaction_participant = Transaction::Participant.find(params[:id])
    @transaction_participant.destroy

    respond_to do |format|
      format.html { redirect_to(transaction_participants_url) }
      format.xml  { head :ok }
    end
  end
end
