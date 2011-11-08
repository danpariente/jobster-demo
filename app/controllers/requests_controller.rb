class RequestsController < ApplicationController
  
  def send_request
  	@user = current_user
  	@contact = User.find(params[:user_id])
  	@request = Request.new
  	
  end
  
  def create 
    @user = current_user
  	#@contact = User.find(params[:request][:receiver_id])
  	@request = Request.new(params[:request])#(:text => params[:text], :from => @user, :user => @contact)
  	if @request.save
      redirect_to contacts_path, :notice => "Request sent..."
    else
      redirect_to :back, :notice => "Can't send a request to that user."
    end	      	
  end	
  
  def show 
  	@user = current_user
  	render :pending
  end
  
  def destroy 
  	@request = Request.find(params[:id])
  	@request.destroy
  	redirect_to :back
  end	
	 
	
end
	
	