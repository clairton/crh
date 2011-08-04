class Taxe::TypesController < ApplicationController
  # GET /taxe/types
  # GET /taxe/types.xml
  def index
    @taxe_types = Taxe::Type.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @taxe_types }
    end
  end

  # GET /taxe/types/1
  # GET /taxe/types/1.xml
  def show
    @taxe_type = Taxe::Type.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @taxe_type }
    end
  end

  # GET /taxe/types/new
  # GET /taxe/types/new.xml
  def new
    @taxe_type = Taxe::Type.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @taxe_type }
    end
  end

  # GET /taxe/types/1/edit
  def edit
    @taxe_type = Taxe::Type.find(params[:id])
  end

  # POST /taxe/types
  # POST /taxe/types.xml
  def create
    @taxe_type = Taxe::Type.new(params[:taxe_type])

    respond_to do |format|
      if @taxe_type.save
        format.html { redirect_to(@taxe_type, :notice => 'Type was successfully created.') }
        format.xml  { render :xml => @taxe_type, :status => :created, :location => @taxe_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @taxe_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /taxe/types/1
  # PUT /taxe/types/1.xml
  def update
    @taxe_type = Taxe::Type.find(params[:id])

    respond_to do |format|
      if @taxe_type.update_attributes(params[:taxe_type])
        format.html { redirect_to(@taxe_type, :notice => 'Type was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @taxe_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /taxe/types/1
  # DELETE /taxe/types/1.xml
  def destroy
    @taxe_type = Taxe::Type.find(params[:id])
    @taxe_type.destroy

    respond_to do |format|
      format.html { redirect_to(taxe_types_url) }
      format.xml  { head :ok }
    end
  end
end
