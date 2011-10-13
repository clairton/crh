class Email::UsersController < ApplicationController
  before_filter :authenticate_user!, :except =>[:some_action_without_auth]
  # GET /email/users
  # GET /email/users.xml
  def index
    @email_users = Email::User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @email_users }
    end
  end

  # GET /email/users/1
  # GET /email/users/1.xml
  def show
    @email_user = Email::User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @email_user }
    end
  end

  # GET /email/users/new
  # GET /email/users/new.xml
  def new
    @email_user = Email::User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @email_user }
    end
  end

  # GET /email/users/1/edit
  def edit
    @email_user = Email::User.find(params[:id])
  end

  # POST /email/users
  # POST /email/users.xml
  def create
    @email_user = Email::User.new(params[:email_user])

    respond_to do |format|
      if @email_user.save
        format.html { redirect_to(@email_user, :notice => 'User was successfully created.') }
        format.xml  { render :xml => @email_user, :status => :created, :location => @email_user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @email_user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /email/users/1
  # PUT /email/users/1.xml
  def update
    @email_user = Email::User.find(params[:id])

    respond_to do |format|
      if @email_user.update_attributes(params[:email_user])
        format.html { redirect_to(@email_user, :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @email_user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /email/users/1
  # DELETE /email/users/1.xml
  def destroy
    @email_user = Email::User.find(params[:id])
    @email_user.destroy

    respond_to do |format|
      format.html { redirect_to(email_users_url) }
      format.xml  { head :ok }
    end
  end
end
