class LikesController < ApplicationController
  include ApplicationHelper	 
  def create
  	#@likeable = find_likeable.nil? ? current_user : find_likeable
  	like = Like.find_by_user_id_and_likeable_id_and_likeable_type(params[:user_id], params[:likeable_id], params[:likeable_type])
    if like == nil
      @like = current_user.likes.create(:user_id => params[:user_id], :likeable_id => params[:likeable_id],
       :likeable_type => params[:likeable_type], :author => params[:author])
      redirect_to :back 
    else
      redirect_to :back, :notice => 'You already liked this.'    	  
    end
  end	
  
  private
  
  def find_likeable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end
end