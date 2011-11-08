class PagesController < ApplicationController
  load_and_authorize_resource	
  uses_tiny_mce :options => {
                            :theme => 'advanced',
                            :theme_advanced_resizing => true,
                            :theme_advanced_resize_horizontal => true,
                            :plugins => %w{ table fullscreen }
                          }
  def index
  	@pageable = find_pageable
  	@user = current_user
  	@pages = @pageable.nil? ? @user.pages : @pageable.pages
  end

  def show
    @user = current_user
    @viewed_user = @user
    @page = Page.find(params[:id])	
  end

  def new
  	@pageable = find_pageable
  	@user = current_user
  	@page = Page.new
  end

  def create
  	@pageable = find_pageable.nil? ? current_user : find_pageable
  	@page = @pageable.pages.build(params[:page])
    if @page.save!
      redirect_to @pageable, :notice  =>  'Page saved' 
    else  
      render :action => 'new'  
    end     
  end

  def edit
  	@user = current_user
  end

  def update
    @page.attributes = params[:page]
    if @page.save!
      redirect_to :back, :notice => "Updated..."
    else 
      redirect_to :action => "index"
    end
  end

  def destroy
    if @page.destroy
      flash[:notice] = "Page deleted..."	    	
    else
      flash[:notice] = "There was a problem deleting the page..."	    	
    end
      redirect_to :back
  end
  
  private

  def find_pageable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end

end
