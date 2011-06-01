class EntriesController < ApplicationController
  def report
    time = Time.at(params[:from].to_i+1)
    @entries = Report.find(params[:report_id]).entry.where("entries.date > :date", {:date => time})
	
    respond_to do |format|
      format.xml  { render :xml => @entries }
    end
  end
  
  def medium
    @mediums = Entry.find(params[:entry_id]).medium
	
    respond_to do |format|
      format.xml  { render :xml => @mediums }
    end
  end
  
  def create
    @entry = Entry.new(
    	:report => Report.find(params[:report_id]),
    	:content => params[:content],
    	:date => Time.now()
    )
    
    if @entry.save
    	if params[:medium]
			params[:medium].each do |medium|
				med = Medium.new(
					:entry =>  @entry,
					:mtype => medium[1][:type],
					:data => medium[1][:data]
				)
				
				med.save
			end
    	end
    	
    	respond_to do |format|
    		format.xml  { render :xml => @entry, :status => :created, :location => @entry }
    	end
    end
  end
end
