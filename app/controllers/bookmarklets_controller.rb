class BookmarkletsController < ApplicationController
  # GET /bookmarklets
  # GET /bookmarklets.xml
  def index
    redirect_to '/'
  end

  # GET /bookmarklets/1
  # GET /bookmarklets/1.xml
  def show
    @bookmarklet = Bookmarklet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.js   do
        @bookmarklet.increment! :count
        render :js => @bookmarklet.code
      end
      format.xml  { render :xml => @bookmarklet }
    end
  end

  # GET /bookmarklets/new
  # GET /bookmarklets/new.xml
  def new
    @bookmarklet = Bookmarklet.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bookmarklet }
    end
  end

  # GET /bookmarklets/1/edit
  def edit
    redirect_to Bookmarklet.find(params[:id])
  end

  # POST /bookmarklets
  # POST /bookmarklets.xml
  def create
    @bookmarklet = Bookmarklet.new(params[:bookmarklet])

    respond_to do |format|
      if @bookmarklet.save
        flash[:notice] = 'Bookmarklet was successfully created.'
        format.html { redirect_to(@bookmarklet) }
        format.xml  { render :xml => @bookmarklet, :status => :created, :location => @bookmarklet }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bookmarklet.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bookmarklets/1
  # PUT /bookmarklets/1.xml
  def update
    redirect_to Bookmarklet.find(params[:id])
  end

  # DELETE /bookmarklets/1
  # DELETE /bookmarklets/1.xml
  def destroy
    redirect_to Bookmarklet.find(params[:id])
  end
end
