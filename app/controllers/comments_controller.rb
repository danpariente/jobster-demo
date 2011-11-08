class CommentsController < ApplicationController

  def index
  	@commentable = find_commentable
  	@user = current_user
  	@comments = @commentable.nil? ? @user.comments : @commentable.comments
  end

  def show
    @user = current_user
    @commentable = find_commentable
    @comment = Comment.find(params[:id])	
  end

  def new
  	@commentable = find_commentable
  	@user = current_user
  	@comment = Comment.new
  end

  def create
  	@commentable = find_commentable.nil? ? current_user : find_commentable
  	@comment = @commentable.comments.build(params[:comment])
    if @comment.save!
      redirect_to :back, :notice  =>  'Comment saved...' 
    else  
      render :action => 'new'  
    end     
  end

  def edit
  end

  def update
    @comment.attributes = params[:comment]
    if @comment.save!
      redirect_to :back, :notice => "Updated..."
    else 
      redirect_to :action => "index"
    end
  end

  def destroy
    if @comment.destroy
      flash[:notice] = "comment deleted..."	    	
    else
      flash[:notice] = "There was a problem deleting the comment..."	    	
    end
      redirect_to :back
  end
  
  private

  def find_commentable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end

end
