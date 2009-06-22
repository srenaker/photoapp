class VisitsController < ApplicationController
  before_filter :get_user, :except => [:photo1, :photo2, :photo3, :photo4, :photo5] 

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
    @visit = @user.visits.build(params[:visit])

    respond_to do |format|
      if @visit.save
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
      if @visit.update_attributes(params[:visit])
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

  def photo1
    @image_data = Visit.find(params[:id]).photo1
    send_data (@image_data, :type => "image/jpeg", 
               :disposition => 'inline')
  end

  def photo2
    @image_data = Visit.find(params[:id]).photo2
    send_data (@image_data, :type => "image/jpeg", 
               :disposition => 'inline')
  end

  def photo3
    @image_data = Visit.find(params[:id]).photo3
    send_data (@image_data, :type => "image/jpeg", 
               :disposition => 'inline')
  end

  def photo4
    @image_data = Visit.find(params[:id]).photo4
    send_data (@image_data, :type => "image/jpeg", 
               :disposition => 'inline')
  end

  def photo5
    @image_data = Visit.find(params[:id]).photo5
    send_data (@image_data, :type => "image/jpeg", 
               :disposition => 'inline')
  end


  private
  def get_user
    @user = User.find(params[:user_id])
  end
  
end
