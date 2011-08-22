class Transaction::Tot::ValuesController < ApplicationController
  # GET /transaction/tot/values
  # GET /transaction/tot/values.xml
  def index
    @transaction_tot_values = Transaction::Tot::Value.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @transaction_tot_values }
    end
  end

  # GET /transaction/tot/values/1
  # GET /transaction/tot/values/1.xml
  def show
    @transaction_tot_value = Transaction::Tot::Value.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @transaction_tot_value }
    end
  end

  # GET /transaction/tot/values/new
  # GET /transaction/tot/values/new.xml
  def new
    @transaction_tot_value = Transaction::Tot::Value.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @transaction_tot_value }
    end
  end

  # GET /transaction/tot/values/1/edit
  def edit
    @transaction_tot_value = Transaction::Tot::Value.find(params[:id])
  end

  # POST /transaction/tot/values
  # POST /transaction/tot/values.xml
  def create
    @transaction_tot_value = Transaction::Tot::Value.new(params[:transaction_tot_value])

    respond_to do |format|
      if @transaction_tot_value.save
        format.html { redirect_to(@transaction_tot_value, :notice => 'Value was successfully created.') }
        format.xml  { render :xml => @transaction_tot_value, :status => :created, :location => @transaction_tot_value }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @transaction_tot_value.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /transaction/tot/values/1
  # PUT /transaction/tot/values/1.xml
  def update
    @transaction_tot_value = Transaction::Tot::Value.find(params[:id])

    respond_to do |format|
      if @transaction_tot_value.update_attributes(params[:transaction_tot_value])
        format.html { redirect_to(@transaction_tot_value, :notice => 'Value was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @transaction_tot_value.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /transaction/tot/values/1
  # DELETE /transaction/tot/values/1.xml
  def destroy
    @transaction_tot_value = Transaction::Tot::Value.find(params[:id])
    @transaction_tot_value.destroy

    respond_to do |format|
      format.html { redirect_to(transaction_tot_values_url) }
      format.xml  { head :ok }
    end
  end
end
