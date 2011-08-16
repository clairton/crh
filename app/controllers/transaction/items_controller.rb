class Transaction::ItemsController < ApplicationController
  # GET /transaction/items
  # GET /transaction/items.xml
  def index
    @transaction_items = Transaction::Item.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @transaction_items }
    end
  end

  # GET /transaction/items/1
  # GET /transaction/items/1.xml
  def show
    @transaction_item = Transaction::Item.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @transaction_item }
    end
  end

  # GET /transaction/items/new
  # GET /transaction/items/new.xml
  def new
    @transaction_item = Transaction::Item.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @transaction_item }
    end
  end

  # GET /transaction/items/1/edit
  def edit
    @transaction_item = Transaction::Item.find(params[:id])
  end

  # POST /transaction/items
  # POST /transaction/items.xml
  def create
    @transaction_item = Transaction::Item.new(params[:transaction_item])

    respond_to do |format|
      if @transaction_item.save
        format.html { redirect_to(@transaction_item, :notice => 'Item was successfully created.') }
        format.xml  { render :xml => @transaction_item, :status => :created, :location => @transaction_item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @transaction_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /transaction/items/1
  # PUT /transaction/items/1.xml
  def update
    @transaction_item = Transaction::Item.find(params[:id])

    respond_to do |format|
      if @transaction_item.update_attributes(params[:transaction_item])
        format.html { redirect_to(@transaction_item, :notice => 'Item was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @transaction_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /transaction/items/1
  # DELETE /transaction/items/1.xml
  def destroy
    @transaction_item = Transaction::Item.find(params[:id])
    @transaction_item.destroy

    respond_to do |format|
      format.html { redirect_to(transaction_items_url) }
      format.xml  { head :ok }
    end
  end
end
