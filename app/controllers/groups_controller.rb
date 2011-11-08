class GroupsController < ApplicationController
  def index
  	@user = current_user
  	@groups = Group.all
  end

  def new
  	@user = current_user
  	@group = Group.new
  end

  def show
  	@user = current_user
  	@group = Group.find(params[:id])
  	@post = Post.new if @user
  	@page = Page.new if @user
  	@membership = Membership.where(:member_id => @user.id, :group_id => @group.id)
  end

  def join
  	@user = current_user
  	@group = Group.find(params[:id])
  	@group.members << @user
  	redirect_to @group
  end

  def create
  	@user = current_user
  	@group = current_user.groups.build(params[:group])
  	#@group.members << @user
  	if @group.save
  	  @membership = @user.memberships.create(:member_id => @user.id, :group_id => @group.id)	
  	  redirect_to @group, :notice => 'Group created successfully...'
  	else
  	  render :action => 'new', :notice => 'Cannot create the group...'	   	
  	end
  end
  
  def leave 
  	@user = current_user
    @group = Group.find(params[:id])
    if @group.members.include?(@user)
      @group.members.delete(@user)
      @group.save	
    end	
    redirect_to @group
  end
  
  def update
    @group.attributes = params[:group]
    if @page.save!
      redirect_to :back, :notice => "Updated..."
    else 
      redirect_to :action => "index"
    end
  end
  
  def destroy
  	@group = Group.find(params[:id])
  	@group.destroy
  	redirect_to groups_path
  end

end
