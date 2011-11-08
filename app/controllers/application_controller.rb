class ApplicationController < ActionController::Base
  helper :all	
  protect_from_forgery
  rescue_from CanCan::AccessDenied do |exception| 
  	flash[:error] = "Access Denied"
  	redirect_to root_url
  end

  
  private
	
    def current_event
	  Event.find(session[:event_id])
	  rescue ActiveRecord::RecordNotFound
	    cart = Event.create
	    session[:event_id] = event.id
	    event
	end

    

end
