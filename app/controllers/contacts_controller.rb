class ContactsController < ApplicationController 
  
  def contacts 
  	@user = current_user
  	@show_search = true
  	@search_results = User.search(params[:search]) 
  	render :contacts
  end
  
  def contacts_user
  	@user = User.find(params[:id])
  	@show_search = false 
  	render :contacts # no code execution just template
  end
  
  def request_contact 
  	@user = current_user
  	@contact = User.find(params[:user_id])
  	@request = Request.new(:text => params[:text], :from => @user, :user => @contact)
  	if @request.save
      redirect_to contacts_path, :notice => "Request sent..."
    else
      redirect_to :back, :notice => "Can't send a request to that user."
    end	  
  end
  	
end