class Request < ActiveRecord::Base
  belongs_to :from, :class_name => 'User', :foreign_key => 'from_id'
  belongs_to :user
  
  def approve 
  	self.user.add_friend(self.from)
  end	 
  
end
