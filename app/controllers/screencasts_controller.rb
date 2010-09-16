class ScreencastsController < ApplicationController
  before_filter :authenticate, :except => [:index, :show]  
  # GET /screencasts
  # GET /screencasts.xml
  def index
    @screencasts = Screencast.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @screencasts }
    end
  end

  # GET /screencasts/1
  # GET /screencasts/1.xml
  def show
    @screencast = Screencast.find(params[:id])
    @antispam_question = rand(5) + 1
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @screencast }
    end
  end

  # GET /screencasts/new
  # GET /screencasts/new.xml
  def new
    @screencast = Screencast.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @screencast }
    end
  end

  # GET /screencasts/1/edit
  def edit
    @screencast = Screencast.find(params[:id])
  end

  # POST /screencasts
  # POST /screencasts.xml
  def create
    @screencast = Screencast.new(params[:screencast])

    respond_to do |format|
      if @screencast.save
        format.html { redirect_to(@screencast, :notice => 'Screencast was successfully created.') }
        format.xml  { render :xml => @screencast, :status => :created, :location => @screencast }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @screencast.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /screencasts/1
  # PUT /screencasts/1.xml
  def update
    @screencast = Screencast.find(params[:id])

    respond_to do |format|
      if @screencast.update_attributes(params[:screencast])
        format.html { redirect_to(@screencast, :notice => 'Screencast was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @screencast.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /screencasts/1
  # DELETE /screencasts/1.xml
  def destroy
    @screencast = Screencast.find(params[:id])
    @screencast.destroy

    respond_to do |format|
      format.html { redirect_to(screencasts_url) }
      format.xml  { head :ok }
    end
  end
end
