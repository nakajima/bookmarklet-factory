class BookmarkletsController < ApplicationController
  def index
    @bookmarklets = Bookmarklet.all(:order => 'count DESC')
  end

  def show
    @bookmarklet = Bookmarklet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.js   do
        @bookmarklet.increment! :count
        render :js => @bookmarklet.code
      end
    end
  end

  def new
    @bookmarklet = Bookmarklet.new
  end

  def edit
    if Array(session[:owns]).include?(params[:id])
      @bookmarklet = Bookmarklet.find(params[:id])
    else
      redirect_to login_bookmarklet_path(params[:id])
    end
  end
  
  def login
    @bookmarklet = Bookmarklet.find(params[:id])
  end
  
  def authorize
    @bookmarklet = Bookmarklet.find_by_id_and_password(params[:id], params[:password])
    if @bookmarklet and @bookmarklet.password?
      session[:owns] ||= []
      session[:owns] << @bookmarklet.id.to_s
      redirect_to edit_bookmarklet_path(@bookmarklet)
    else
      flash[:notice] = 'No dice. Try again.'
      redirect_to :action => 'login'
    end
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

  def update
    if session[:owns].include?(params[:id])
      @bookmarklet = Bookmarklet.find(params[:id])
      if @bookmarklet.update_attributes(params[:bookmarklet])
        flash[:notice] = 'Success!'
        redirect_to @bookmarklet
      else
        edit_bookmarklet_path(@bookmarklet)
      end
    else
      flash[:notice] = 'No dice. Try again.'
      redirect_to :action => 'login'
    end
  end

  # DELETE /bookmarklets/1
  # DELETE /bookmarklets/1.xml
  def destroy
    redirect_to Bookmarklet.find(params[:id])
  end
  
  private
  
  def login_required
    
  end
end
