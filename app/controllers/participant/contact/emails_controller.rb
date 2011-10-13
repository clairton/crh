class Participant::Contact::EmailsController < ApplicationController
  before_filter :authenticate_user!, :except =>[:some_action_without_auth]
  # GET /participant/contact/emails
  # GET /participant/contact/emails.xml
  def index
    @participant_contact_emails = Participant::Contact::Email.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @participant_contact_emails }
    end
  end

  # GET /participant/contact/emails/1
  # GET /participant/contact/emails/1.xml
  def show
    @participant_contact_email = Participant::Contact::Email.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @participant_contact_email }
    end
  end

  # GET /participant/contact/emails/new
  # GET /participant/contact/emails/new.xml
  def new
    @participant_contact_email = Participant::Contact::Email.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @participant_contact_email }
    end
  end

  # GET /participant/contact/emails/1/edit
  def edit
    @participant_contact_email = Participant::Contact::Email.find(params[:id])
  end

  # POST /participant/contact/emails
  # POST /participant/contact/emails.xml
  def create
    @participant_contact_email = Participant::Contact::Email.new(params[:participant_contact_email])

    respond_to do |format|
      if @participant_contact_email.save
        format.html { redirect_to(@participant_contact_email, :notice => 'Email was successfully created.') }
        format.xml  { render :xml => @participant_contact_email, :status => :created, :location => @participant_contact_email }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @participant_contact_email.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /participant/contact/emails/1
  # PUT /participant/contact/emails/1.xml
  def update
    @participant_contact_email = Participant::Contact::Email.find(params[:id])

    respond_to do |format|
      if @participant_contact_email.update_attributes(params[:participant_contact_email])
        format.html { redirect_to(@participant_contact_email, :notice => 'Email was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @participant_contact_email.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /participant/contact/emails/1
  # DELETE /participant/contact/emails/1.xml
  def destroy
    @participant_contact_email = Participant::Contact::Email.find(params[:id])
    @participant_contact_email.destroy

    respond_to do |format|
      format.html { redirect_to(participant_contact_emails_url) }
      format.xml  { head :ok }
    end
  end
end
