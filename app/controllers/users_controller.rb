class UsersController < ApplicationController
  def index
  	@users = User.all
  	respond_to do |format| 
  	  format.html
  	  format.json { render :json => @users.map(&:attributes)}#.each {|h| h.dup.map { |k,v| [k.gsub!("username", "name"), v] }} }	
  	end
  end

  def new
  	@user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Successfully created User." 
      redirect_to login_path, :notice => 'Successfully registered. You can join with your account now...'
    else
      flash[:notice] = "Couldn't create User." 	
      render :action => 'new'
    end
  end

  def show
  	@user = User.find(params[:id])
  	#@user = current_user    CANT DO THIS IF THE USER IS CREATED IN THAT MOMENT APP CRASHES
  	@myself = @user
  	#@viewed_user = User.find_by_username(params[:username])
  	@viewed_user = User.find(params[:id])
  	@viewing_self = (@viewed_user == @myself)
  	all = [] + @viewed_user.activities + @viewed_user.wall.posts + @viewed_user.statuses
    @all = all.sort {|x,y| y.created_at <=> x.created_at}
  end
  
  def show_by_username 
  	@user = current_user
  	@viewed_user = User.find_by_username(params[:username])
  	all = [] + @viewed_user.activities + @viewed_user.wall.posts + @viewed_user.statuses
    @all = all.sort {|x,y| y.created_at <=> x.created_at}
  	#@myself = @user
  	#@viewed_user = User.find_by_username(params[:username])
  	#@viewing_self = (@viewed_user == @myself)
  	render :action => 'show'
  end
  
  #TODO add some enable / disable method for admins

  def edit
    @user = User.find(params[:id])
  end

   def update
    @user = User.find(params[:id])
    #params[:user].delete(:password) if params[:user][:password].blank?
    #params[:user].delete(:password_confirmation) if params[:user][:password].blank? and params[:user][:password_confirmation].blank?
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated User."
      redirect_to users_path
    else
      render :action => 'edit'
    end
  end
  
  def profile 
    @user = current_user          	
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_url, :notice => "Successfully destroyed user."
  end

end
