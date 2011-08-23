class Transaction::TotsController < ApplicationController
  # GET /transaction/tots
  # GET /transaction/tots.xml
  def index
    @transaction_tots = Transaction::Tot.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @transaction_tots }
    end
  end

  # GET /transaction/tots/1
  # GET /transaction/tots/1.xml
  def show
    @transaction_tot = Transaction::Tot.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @transaction_tot }
    end
  end

  # GET /transaction/tots/new
  # GET /transaction/tots/new.xml
  def new
    @transaction_tot = Transaction::Tot.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @transaction_tot }
    end
  end

  # GET /transaction/tots/1/edit
  def edit
    @transaction_tot = Transaction::Tot.find(params[:id])
  end

  # POST /transaction/tots
  # POST /transaction/tots.xml
  def create
    @transaction_tot = Transaction::Tot.new(params[:transaction_tot])

    respond_to do |format|
      if @transaction_tot.save
        format.html { redirect_to(@transaction_tot, :notice => 'Tot was successfully created.') }
        format.xml  { render :xml => @transaction_tot, :status => :created, :location => @transaction_tot }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @transaction_tot.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /transaction/tots/1
  # PUT /transaction/tots/1.xml
  def update
    @transaction_tot = Transaction::Tot.find(params[:id])

    respond_to do |format|
      if @transaction_tot.update_attributes(params[:transaction_tot])
        format.html { redirect_to(@transaction_tot, :notice => 'Tot was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @transaction_tot.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /transaction/tots/1
  # DELETE /transaction/tots/1.xml
  def destroy
    @transaction_tot = Transaction::Tot.find(params[:id])
    @transaction_tot.destroy

    respond_to do |format|
      format.html { redirect_to(transaction_tots_url) }
      format.xml  { head :ok }
    end
  end
end
