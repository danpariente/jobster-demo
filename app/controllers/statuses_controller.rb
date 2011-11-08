class StatusesController < ApplicationController
  def create 
  	@user = current_user
  	@status = @user.statuses.build(params[:status])
  	if @status.save 
  	  redirect_to :back	
  	end
  end
  
  def destroy
  	@status = Status.find(params[:id])  	
  	@status.destroy
  	redirect_to :back
  end	
end