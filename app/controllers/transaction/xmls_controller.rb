class Transaction::xmlsController < ApplicationController
  before_filter :authenticate_user!, :except =>[:some_action_without_auth]
  # GET /transaction/xmls
  # GET /transaction/xmls.xml
  def index
    @transaction_xmls = Transaction::xml.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @transaction_xmls }
    end
  end

  # GET /transaction/xmls/1
  # GET /transaction/xmls/1.xml
  def show
    @transaction_xml = Transaction::xml.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @transaction_xml }
    end
  end

  # GET /transaction/xmls/new
  # GET /transaction/xmls/new.xml
  def new
    @transaction_xml = Transaction::xml.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @transaction_xml }
    end
  end

  # GET /transaction/xmls/1/edit
  def edit
    @transaction_xml = Transaction::xml.find(params[:id])
  end

  # POST /transaction/xmls
  # POST /transaction/xmls.xml
  def create
    @transaction_xml = Transaction::xml.new
    respond_to do |format|
      if @transaction_xml.parse(params[:transaction_xml][:xml].open)
        format.html { redirect_to(@transaction_xml, :notice => 'Importado com Sucesso!!!') }
        format.xml  { render :xml => @transaction_xml, :status => :created, :location => @transaction_xml }
      else
        format.html { redirect_to(@transaction_xml, :notice => 'Houve um erro ao importar o arquivo!!') }
        format.xml  { render :xml => @transaction_xml.errors, :status => :unprocessable_entity }          
      end
    end
  end

  # PUT /transaction/xmls/1
  # PUT /transaction/xmls/1.xml
  def update
    Transaction::xml.transaction do
      @transaction_xml = Transaction::xml.find(params[:id])
      respond_to do |format|
        if @transaction_xml.parse(params[:transaction_xml][:xml].open) and @transaction_xml.update_attributes(params[:transaction_xml])
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
    @transaction_xml = Transaction::xml.find(params[:id])
    @transaction_xml.destroy

    respond_to do |format|
      format.html { redirect_to(transaction_xmls_url) }
      format.xml  { head :ok }
    end
  end
end
