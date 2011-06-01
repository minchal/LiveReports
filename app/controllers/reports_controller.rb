class ReportsController < ApplicationController
  def index
    @reports = Report.where(:status => 1).order("id DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @reports }
    end
  end
  
  def archives
    @reports = Report.order("id DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @reports }
    end
  end

  def show
	
    @report = Report.find(params[:id])
	
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @report }
    end
  end
end
