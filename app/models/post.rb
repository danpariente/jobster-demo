class Post < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :wall
  
  has_many :comments, :as => :commentable	
  has_many :likes, :as => :likeable
end
