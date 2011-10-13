class Email::DomainsController < ApplicationController
  before_filter :authenticate_user!, :except =>[:some_action_without_auth]
  # GET /email/domains
  # GET /email/domains.xml
  def index
    @email_domains = Email::Domain.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @email_domains }
    end
  end

  # GET /email/domains/1
  # GET /email/domains/1.xml
  def show
    @email_domain = Email::Domain.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @email_domain }
    end
  end

  # GET /email/domains/new
  # GET /email/domains/new.xml
  def new
    @email_domain = Email::Domain.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @email_domain }
    end
  end

  # GET /email/domains/1/edit
  def edit
    @email_domain = Email::Domain.find(params[:id])
  end

  # POST /email/domains
  # POST /email/domains.xml
  def create
    @email_domain = Email::Domain.new(params[:email_domain])

    respond_to do |format|
      if @email_domain.save
        format.html { redirect_to(@email_domain, :notice => 'Domain was successfully created.') }
        format.xml  { render :xml => @email_domain, :status => :created, :location => @email_domain }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @email_domain.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /email/domains/1
  # PUT /email/domains/1.xml
  def update
    @email_domain = Email::Domain.find(params[:id])

    respond_to do |format|
      if @email_domain.update_attributes(params[:email_domain])
        format.html { redirect_to(@email_domain, :notice => 'Domain was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @email_domain.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /email/domains/1
  # DELETE /email/domains/1.xml
  def destroy
    @email_domain = Email::Domain.find(params[:id])
    @email_domain.destroy

    respond_to do |format|
      format.html { redirect_to(email_domains_url) }
      format.xml  { head :ok }
    end
  end
end
