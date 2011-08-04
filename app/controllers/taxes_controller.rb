class TaxesController < ApplicationController
  # GET /taxes
  # GET /taxes.xml
  def index
    @taxes = Taxe.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @taxes }
    end
  end

  # GET /taxes/1
  # GET /taxes/1.xml
  def show
    @taxis = Taxe.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @taxis }
    end
  end

  # GET /taxes/new
  # GET /taxes/new.xml
  def new
    @taxis = Taxe.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @taxis }
    end
  end

  # GET /taxes/1/edit
  def edit
    @taxis = Taxe.find(params[:id])
  end

  # POST /taxes
  # POST /taxes.xml
  def create
    @taxis = Taxe.new(params[:taxis])

    respond_to do |format|
      if @taxis.save
        format.html { redirect_to(@taxis, :notice => 'Taxe was successfully created.') }
        format.xml  { render :xml => @taxis, :status => :created, :location => @taxis }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @taxis.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /taxes/1
  # PUT /taxes/1.xml
  def update
    @taxis = Taxe.find(params[:id])

    respond_to do |format|
      if @taxis.update_attributes(params[:taxis])
        format.html { redirect_to(@taxis, :notice => 'Taxe was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @taxis.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /taxes/1
  # DELETE /taxes/1.xml
  def destroy
    @taxis = Taxe.find(params[:id])
    @taxis.destroy

    respond_to do |format|
      format.html { redirect_to(taxes_url) }
      format.xml  { head :ok }
    end
  end
end
