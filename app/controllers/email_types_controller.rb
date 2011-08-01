class EmailTypesController < ApplicationController
  # GET /email_types
  # GET /email_types.xml
  def index
    @email_types = EmailType.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @email_types }
    end
  end

  # GET /email_types/1
  # GET /email_types/1.xml
  def show
    @email_type = EmailType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @email_type }
    end
  end

  # GET /email_types/new
  # GET /email_types/new.xml
  def new
    @email_type = EmailType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @email_type }
    end
  end

  # GET /email_types/1/edit
  def edit
    @email_type = EmailType.find(params[:id])
  end

  # POST /email_types
  # POST /email_types.xml
  def create
    @email_type = EmailType.new(params[:email_type])

    respond_to do |format|
      if @email_type.save
        format.html { redirect_to(@email_type, :notice => 'Email type was successfully created.') }
        format.xml  { render :xml => @email_type, :status => :created, :location => @email_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @email_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /email_types/1
  # PUT /email_types/1.xml
  def update
    @email_type = EmailType.find(params[:id])

    respond_to do |format|
      if @email_type.update_attributes(params[:email_type])
        format.html { redirect_to(@email_type, :notice => 'Email type was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @email_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /email_types/1
  # DELETE /email_types/1.xml
  def destroy
    @email_type = EmailType.find(params[:id])
    @email_type.destroy

    respond_to do |format|
      format.html { redirect_to(email_types_url) }
      format.xml  { head :ok }
    end
  end
end
