class FriendshipsController < ApplicationController
	def create
		@contact = User.find(params[:friend_id])
	    @friendship = current_user.friendships.build(:friend_id => params[:friend_id]) if current_user
	    @inverse_friendship = @contact.friendships.build(:friend_id => current_user.id) if @contact
	    if @friendship.save and @inverse_friendship.save
	      @request = Request.find_by_user_id_and_from_id(current_user.id, params[:friend_id])	
	      @request.destroy
	      flash[:notice] = "Added friend."
	      redirect_to current_user
	    else
	      flash[:error] = "Unable to add friend."
	      redirect_to current_user
	    end
	end

	def destroy
	  @friendship = current_user.friendships.find(params[:id])
	  @friendship.destroy
	  flash[:notice] = "Removed friendship."
	  redirect_to current_user
	end
end
