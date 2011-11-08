class PreferencesController < ApplicationController
  
  def new 
  	@preference = Preference.new
  end	
	
  def create 
  	@profile = Profile.find(params[:id])
    @preference = @post.create_preference(params[:preference])
    redirect_to profile_path(@profile)
  end	  
		
end
