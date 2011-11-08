class Like < ActiveRecord::Base
  belongs_to :user	
  belongs_to :likeable, :polymorphic => true
  
  validates_uniqueness_of :likeable_id, :scope => [:likeable_type, :user_id]
  	
end
