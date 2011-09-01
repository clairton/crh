class Transaction::XmlsController < ApplicationController
  # GET /transaction/xmls
  # GET /transaction/xmls.xml
  def index
    @transaction_xmls = Transaction::Xml.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @transaction_xmls }
    end
  end

  # GET /transaction/xmls/1
  # GET /transaction/xmls/1.xml
  def show
    @transaction_xml = Transaction::Xml.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @transaction_xml }
    end
  end

  # GET /transaction/xmls/new
  # GET /transaction/xmls/new.xml
  def new
    @transaction_xml = Transaction::Xml.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @transaction_xml }
    end
  end

  # GET /transaction/xmls/1/edit
  def edit
    @transaction_xml = Transaction::Xml.find(params[:id])
  end

  # POST /transaction/xmls
  # POST /transaction/xmls.xml
  def create
    Transaction::Xml.transaction do
      @transaction_xml = Transaction::Xml.new(params[:transaction_xml])
      respond_to do |format|
        #if @transaction_xml.save() and @transaction_xml.parse(@tempfilefile[7..-2])
        if @transaction_xml.parse('/home/clairton/crh/public/system/xmls/5/original/42110709363232000189550020000020221000012318-nfe.xml') and @transaction_xml.save()
          format.html { redirect_to(@transaction_xml, :notice => 'Xml was successfully created.') }
          format.xml  { render :xml => @transaction_xml, :status => :created, :location => @transaction_xml }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @transaction_xml.errors, :status => :unprocessable_entity }          
        end
      end
    end
  end

  # PUT /transaction/xmls/1
  # PUT /transaction/xmls/1.xml
  def update
    Transaction::Xml.transaction do
      @transaction_xml = Transaction::Xml.find(params[:id])
      respond_to do |format|
        #if @transaction_xml.update_attributes(params[:transaction_xml]) and @transaction_xml.parse(@tempfilefile[7..-2]) 
        if @transaction_xml.parse('/home/clairton/crh/public/system/xmls/5/original/42110709363232000189550020000020221000012318-nfe.xml') and @transaction_xml.update_attributes(params[:transaction_xml])
          format.html { redirect_to(@transaction_xml, :notice => 'Xml was successfully updated.') }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @transaction_xml.errors, :status => :unprocessable_entity }        
        end
      end
    end
  end

  # DELETE /transaction/xmls/1
  # DELETE /transaction/xmls/1.xml
  def destroy
    @transaction_xml = Transaction::Xml.find(params[:id])
    @transaction_xml.destroy

    respond_to do |format|
      format.html { redirect_to(transaction_xmls_url) }
      format.xml  { head :ok }
    end
  end
end
