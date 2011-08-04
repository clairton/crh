class AdressesController < ApplicationController
  # GET /adresses
  # GET /adresses.xml
  def index
    @adresses = Adress.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @adresses }
    end
  end

  # GET /adresses/1
  # GET /adresses/1.xml
  def show
    @adress = Adress.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @adress }
    end
  end

  # GET /adresses/new
  # GET /adresses/new.xml
  def new
    @adress = Adress.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @adress }
    end
  end

  # GET /adresses/1/edit
  def edit
    @adress = Adress.find(params[:id])
  end

  # POST /adresses
  # POST /adresses.xml
  def create
    @adress = Adress.new(params[:adress])

    respond_to do |format|
      if @adress.save
        format.html { redirect_to(@adress, :notice => 'Adress was successfully created.') }
        format.xml  { render :xml => @adress, :status => :created, :location => @adress }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @adress.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /adresses/1
  # PUT /adresses/1.xml
  def update
    @adress = Adress.find(params[:id])

    respond_to do |format|
      if @adress.update_attributes(params[:adress])
        format.html { redirect_to(@adress, :notice => 'Adress was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @adress.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /adresses/1
  # DELETE /adresses/1.xml
  def destroy
    @adress = Adress.find(params[:id])
    @adress.destroy

    respond_to do |format|
      format.html { redirect_to(adresses_url) }
      format.xml  { head :ok }
    end
  end
end
