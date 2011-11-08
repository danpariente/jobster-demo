class PostsController < ApplicationController
  def create 
  	@user = current_user
  	@post = @user.posts.build(params[:post])
  	if @post.save 
  	  redirect_to :back	
  	end
  end
  
  def destroy
  	@post = Post.find(params[:id])  	
  	@post.destroy
  	redirect_to :back
  end	
end