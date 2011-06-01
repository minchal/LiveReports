class ChatEntriesController < ApplicationController
  def report
    @entries = Report.find(params[:report_id]).chat_entry.where("chat_entries.id > :id", {:id => params[:from].to_i})
	
	#print "count: " + @entries.count.to_s
	
    respond_to do |format|
      format.xml # { render :xml => @entries }
    end
  end

  def create
    @entry = ChatEntry.new(
    	:report => Report.find(params[:report_id]),
    	:content => params[:content],
    	:date => Time.now(),
    	:user => User.find(session[:user_id]) # DONE
    )
    
    if @entry.save
    	respond_to do |format|
    		format.xml  { render :xml => @entry, :status => :created, :location => @entry }
    	end
    end
  end
end
