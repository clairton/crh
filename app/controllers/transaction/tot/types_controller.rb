class Transaction::Tot::TypesController < ApplicationController
  # GET /transaction/tot/types
  # GET /transaction/tot/types.xml
  def index
    @transaction_tot_types = Transaction::Tot::Type.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @transaction_tot_types }
    end
  end

  # GET /transaction/tot/types/1
  # GET /transaction/tot/types/1.xml
  def show
    @transaction_tot_type = Transaction::Tot::Type.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @transaction_tot_type }
    end
  end

  # GET /transaction/tot/types/new
  # GET /transaction/tot/types/new.xml
  def new
    @transaction_tot_type = Transaction::Tot::Type.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @transaction_tot_type }
    end
  end

  # GET /transaction/tot/types/1/edit
  def edit
    @transaction_tot_type = Transaction::Tot::Type.find(params[:id])
  end

  # POST /transaction/tot/types
  # POST /transaction/tot/types.xml
  def create
    @transaction_tot_type = Transaction::Tot::Type.new(params[:transaction_tot_type])

    respond_to do |format|
      if @transaction_tot_type.save
        format.html { redirect_to(@transaction_tot_type, :notice => 'Type was successfully created.') }
        format.xml  { render :xml => @transaction_tot_type, :status => :created, :location => @transaction_tot_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @transaction_tot_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /transaction/tot/types/1
  # PUT /transaction/tot/types/1.xml
  def update
    @transaction_tot_type = Transaction::Tot::Type.find(params[:id])

    respond_to do |format|
      if @transaction_tot_type.update_attributes(params[:transaction_tot_type])
        format.html { redirect_to(@transaction_tot_type, :notice => 'Type was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @transaction_tot_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /transaction/tot/types/1
  # DELETE /transaction/tot/types/1.xml
  def destroy
    @transaction_tot_type = Transaction::Tot::Type.find(params[:id])
    @transaction_tot_type.destroy

    respond_to do |format|
      format.html { redirect_to(transaction_tot_types_url) }
      format.xml  { head :ok }
    end
  end
end
