class Financier::NotesController < ApplicationController
  before_filter :authenticate_user!, :except =>[:some_action_without_auth]
  # GET /financier/notes
  # GET /financier/notes.xml
  def index
    @financier_notes = Financier::Note.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @financier_notes }
    end
  end

  # GET /financier/notes/1
  # GET /financier/notes/1.xml
  def show
    @financier_note = Financier::Note.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @financier_note }
    end
  end

  # GET /financier/notes/new
  # GET /financier/notes/new.xml
  def new
    @financier_note = Financier::Note.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @financier_note }
    end
  end

  # GET /financier/notes/1/edit
  def edit
    @financier_note = Financier::Note.find(params[:id])
  end

  # POST /financier/notes
  # POST /financier/notes.xml
  def create
    @financier_note = Financier::Note.new(params[:financier_note])

    respond_to do |format|
      if @financier_note.save
        format.html { redirect_to(@financier_note, :notice => 'Note was successfully created.') }
        format.xml  { render :xml => @financier_note, :status => :created, :location => @financier_note }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @financier_note.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /financier/notes/1
  # PUT /financier/notes/1.xml
  def update
    @financier_note = Financier::Note.find(params[:id])

    respond_to do |format|
      if @financier_note.update_attributes(params[:financier_note])
        format.html { redirect_to(@financier_note, :notice => 'Note was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @financier_note.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /financier/notes/1
  # DELETE /financier/notes/1.xml
  def destroy
    @financier_note = Financier::Note.find(params[:id])
    @financier_note.destroy

    respond_to do |format|
      format.html { redirect_to(financier_notes_url) }
      format.xml  { head :ok }
    end
  end
end
