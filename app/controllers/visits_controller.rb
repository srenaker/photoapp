class VisitsController < ApplicationController
  before_filter :get_user, :except => [:photo1] 

  # GET /visits
  # GET /visits.xml
  def index
    @visits = @user.visits

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @visits }
    end
  end

  # GET /visits/1
  # GET /visits/1.xml
  def show
    @visit = @user.visits.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @visit }
    end
  end

  # GET /visits/new
  # GET /visits/new.xml
  def new
    @visit = @user.visits.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @visit }
    end
  end

  # GET /visits/1/edit
  def edit
    @visit = @user.visits.find(params[:id])


  end

  # POST /visits
  # POST /visits.xml
  def create
    photo_raw = params[:visit].delete(:photo_data).read
    
    @visit = @user.visits.build(params[:visit])

    respond_to do |format|
      if (@visit.save)
    
        @visit.photos.create!(:photo_data => photo_raw)
               

        flash[:notice] = 'Visit was successfully created.'
        format.html { redirect_to([@user, @visit]) }
        format.xml  { render :xml => @visit, :status => :created, :location => @visit }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @visit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /visits/1
  # PUT /visits/1.xml
  def update
    @visit = @user.visits.find(params[:id])

    respond_to do |format|

      photo_raw = params[:visit].delete(:photo_data).read  

      if @visit.update_attributes(params[:visit])

        @visit.photos.create!(:photo_data => photo_raw) 

        flash[:notice] = 'Visit was successfully updated.'
        format.html { redirect_to([@user, @visit]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @visit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /visits/1
  # DELETE /visits/1.xml
  def destroy
    @visit = @user.visits.find(params[:id])
    @visit.destroy

    respond_to do |format|
      format.html { redirect_to(user_visits_path(@user)) }
      format.xml  { head :ok }
    end
  end

  def photo
    @image_data = Visit.find(params[:visit_id]).photos.find(params[:photo_id]).photo_data
    send_data(@image_data, :type => "image/jpeg", 
               :disposition => 'inline')
  end


  private
  def get_user
    @user = User.find(params[:user_id])
  end
  
end
