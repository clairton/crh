class Taxe::GroupsController < ApplicationController
  before_filter :authenticate_user!, :except =>[:some_action_without_auth]
  # GET /taxe/groups
  # GET /taxe/groups.xml
  def index
    @taxe_groups = Taxe::Group.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @taxe_groups }
    end
  end

  # GET /taxe/groups/1
  # GET /taxe/groups/1.xml
  def show
    @taxe_group = Taxe::Group.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @taxe_group }
    end
  end

  # GET /taxe/groups/new
  # GET /taxe/groups/new.xml
  def new
    @taxe_group = Taxe::Group.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @taxe_group }
    end
  end

  # GET /taxe/groups/1/edit
  def edit
    @taxe_group = Taxe::Group.find(params[:id])
  end

  # POST /taxe/groups
  # POST /taxe/groups.xml
  def create
    @taxe_group = Taxe::Group.new(params[:taxe_group])

    respond_to do |format|
      if @taxe_group.save
        format.html { redirect_to(@taxe_group, :notice => 'Group was successfully created.') }
        format.xml  { render :xml => @taxe_group, :status => :created, :location => @taxe_group }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @taxe_group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /taxe/groups/1
  # PUT /taxe/groups/1.xml
  def update
    @taxe_group = Taxe::Group.find(params[:id])

    respond_to do |format|
      if @taxe_group.update_attributes(params[:taxe_group])
        format.html { redirect_to(@taxe_group, :notice => 'Group was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @taxe_group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /taxe/groups/1
  # DELETE /taxe/groups/1.xml
  def destroy
    @taxe_group = Taxe::Group.find(params[:id])
    @taxe_group.destroy

    respond_to do |format|
      format.html { redirect_to(taxe_groups_url) }
      format.xml  { head :ok }
    end
  end
end
