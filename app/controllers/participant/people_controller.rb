class Participant::PeopleController < ApplicationController
  # GET /participant/people
  # GET /participant/people.xml
  def index
    @participant_people = Participant::Person.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @participant_people }
    end
  end

  # GET /participant/people/1
  # GET /participant/people/1.xml
  def show
    @participant_person = Participant::Person.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @participant_person }
    end
  end

  # GET /participant/people/new
  # GET /participant/people/new.xml
  def new
    @participant_person = Participant::Person.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @participant_person }
    end
  end

  # GET /participant/people/1/edit
  def edit
    @participant_person = Participant::Person.find(params[:id])
  end

  # POST /participant/people
  # POST /participant/people.xml
  def create
    @participant_person = Participant::Person.new(params[:participant_person])

    respond_to do |format|
      if @participant_person.save
        format.html { redirect_to(@participant_person, :notice => 'Person was successfully created.') }
        format.xml  { render :xml => @participant_person, :status => :created, :location => @participant_person }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @participant_person.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /participant/people/1
  # PUT /participant/people/1.xml
  def update
    @participant_person = Participant::Person.find(params[:id])

    respond_to do |format|
      if @participant_person.update_attributes(params[:participant_person])
        format.html { redirect_to(@participant_person, :notice => 'Person was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @participant_person.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /participant/people/1
  # DELETE /participant/people/1.xml
  def destroy
    @participant_person = Participant::Person.find(params[:id])
    @participant_person.destroy

    respond_to do |format|
      format.html { redirect_to(participant_people_url) }
      format.xml  { head :ok }
    end
  end
end
