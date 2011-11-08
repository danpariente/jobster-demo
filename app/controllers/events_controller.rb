class EventsController < ApplicationController
  
  def index
  	@user = current_user
  	@events = Event.all
  end

  def show
  	@user = current_user
  	@post = Post.new if @user
  	@page = Page.new if @user
  	@event = Event.find(params[:id])
  end

  def add
  	@user = current_user
  	@event = Event.new
  end

  def create
  	@content = params[:event] || {}
    @event = Event.new(params[:event])
    if @event.save 
      users = @content['invites'].split(',')
      users.each do |user|
        invitee = User.find_by_username(user.strip)
        Pending.create(:pending_event => @event, :pending_user => invitee)
      end
      Confirm.create(:confirmed_event => @event, :confirmed_user => current_user)    
    end
    redirect_to @event, :notice => 'Event was successfully created...'  #"/events/#{@event.id}"
  end
  
  def update
    @event = Event.find(params[:id])
    @user = current_user
    @attendance = params[:attendance]
    case @attendance
      when 'yes'
        Pending.where(:user_id => @user.id, :event_id => @event.id).first.destroy if @event.pending_users.include? @user
        Decline.where(:user_id => @user.id, :event_id => @event.id).first.destroy if @event.declined_users.include? @user
        Confirm.create(:confirmed_event => @event, :confirmed_user => @user)
      when 'no'
        Confirm.where(:user_id => @user.id, :event_id => @event.id).first.destroy if @event.confirmed_users.include? @user
        Pending.where(:user_id => @user.id, :event_id => @event.id).first.destroy if @event.pending_users.include? @user
        Decline.create(:declined_user => @user, :declined_event => @event) 
      when 'maybe'
        Confirm.where(:user_id => @user.id, :event_id => @event.id).first.destroy if @event.confirmed_users.include? @user
        Decline.where(:user_id => @user.id, :event_id => @event.id).first.destroy if @event.declined_users.include? @user
        Pending.create(:pending_user => @user, :pending_event => @event) 
      end

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to(@event, :notice => 'Event was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end 
  
  def destroy
  	@event = Event.find(params[:id])
    @event.destroy
    redirect_to '/events'
  end
   

end
