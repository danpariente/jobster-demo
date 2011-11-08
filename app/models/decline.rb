class Decline < ActiveRecord::Base
  belongs_to :declined_user, :class_name => 'User', :foreign_key => "user_id"
  belongs_to :declined_event, :class_name => 'Event', :foreign_key => "event_id"	
end
