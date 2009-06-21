class UsersController < ApplicationController
  # GET /users
  # GET /users.xml
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        flash[:notice] = 'User was successfully created.'
        format.html { redirect_to(@user) }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = 'User was successfully updated.'
        format.html { redirect_to(@user) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end

  # GET /users/1/cars
  def cars
    @user = User.find(params[:id])
    @cars = @user.cars
  end

  def car_add
    @user = User.find(params[:id])
    @car = Car.find(params[:car])

    unless @user.has_car?(@car)
      @user.cars << @car
      flash[:notice] = 'Car was added.'
    else
      flash[:error] = 'User already has that car!'
    end

    redirect_to :action => :cars, :id => @user
  end

  def car_remove

    @user = User.find(params[:id])

    # get list of cars to remove from query string
    car_ids = params[:cars]

    unless car_ids.blank?
      car_ids.each do |car_id|
        car = Car.find(car_id)
        if @user.has_car?(car)
          logger.info "Removing user from list of car owners for car #{car.id}"
          @user.cars.delete(car)
          flash[:notice] = 'Car was removed.'
        end
      end
    end
    redirect_to :action => :cars, :id => @user
  end

end
