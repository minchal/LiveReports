class ChatEntriesController < ApplicationController
  # GET /chat_entries
  # GET /chat_entries.xml
  def index
    @chat_entries = ChatEntry.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @chat_entries }
    end
  end

  # GET /chat_entries/1
  # GET /chat_entries/1.xml
  def show
    @chat_entry = ChatEntry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @chat_entry }
    end
  end

  # GET /chat_entries/new
  # GET /chat_entries/new.xml
  def new
    @chat_entry = ChatEntry.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @chat_entry }
    end
  end

  # GET /chat_entries/1/edit
  def edit
    @chat_entry = ChatEntry.find(params[:id])
  end

  # POST /chat_entries
  # POST /chat_entries.xml
  def create
    @chat_entry = ChatEntry.new(params[:chat_entry])

    respond_to do |format|
      if @chat_entry.save
        format.html { redirect_to(@chat_entry, :notice => 'Chat entry was successfully created.') }
        format.xml  { render :xml => @chat_entry, :status => :created, :location => @chat_entry }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @chat_entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /chat_entries/1
  # PUT /chat_entries/1.xml
  def update
    @chat_entry = ChatEntry.find(params[:id])

    respond_to do |format|
      if @chat_entry.update_attributes(params[:chat_entry])
        format.html { redirect_to(@chat_entry, :notice => 'Chat entry was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @chat_entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /chat_entries/1
  # DELETE /chat_entries/1.xml
  def destroy
    @chat_entry = ChatEntry.find(params[:id])
    @chat_entry.destroy

    respond_to do |format|
      format.html { redirect_to(chat_entries_url) }
      format.xml  { head :ok }
    end
  end
end
