class PersonTypesController < ApplicationController
  # GET /person_types
  # GET /person_types.xml
  def index
    @person_types = PersonType.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @person_types }
    end
  end

  # GET /person_types/1
  # GET /person_types/1.xml
  def show
    @person_type = PersonType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @person_type }
    end
  end

  # GET /person_types/new
  # GET /person_types/new.xml
  def new
    @person_type = PersonType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @person_type }
    end
  end

  # GET /person_types/1/edit
  def edit
    @person_type = PersonType.find(params[:id])
  end

  # POST /person_types
  # POST /person_types.xml
  def create
    @person_type = PersonType.new(params[:person_type])

    respond_to do |format|
      if @person_type.save
        format.html { redirect_to(@person_type, :notice => 'Person type was successfully created.') }
        format.xml  { render :xml => @person_type, :status => :created, :location => @person_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @person_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /person_types/1
  # PUT /person_types/1.xml
  def update
    @person_type = PersonType.find(params[:id])

    respond_to do |format|
      if @person_type.update_attributes(params[:person_type])
        format.html { redirect_to(@person_type, :notice => 'Person type was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @person_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /person_types/1
  # DELETE /person_types/1.xml
  def destroy
    @person_type = PersonType.find(params[:id])
    @person_type.destroy

    respond_to do |format|
      format.html { redirect_to(person_types_url) }
      format.xml  { head :ok }
    end
  end
end
