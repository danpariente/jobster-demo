class MembershipsController < ApplicationController
	def create
		#@group = Group.find(params[:id])
	    @membership = current_user.memberships.build(:member_id => params[:member_id], :group_id => params[:group_id])
	    if @membership.save
	      flash[:notice] = "Group Joined."
	      redirect_to :back
	    else
	      flash[:error] = "Unable to join the group."
	      redirect_to :back
	    end
	end

	def destroy
	  @membership = current_user.memberships.find(params[:id])
	  @membership.destroy
	  flash[:notice] = "Removed membership."
	  redirect_to :back
	end
end
