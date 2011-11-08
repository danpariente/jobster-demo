class Confirm < ActiveRecord::Base
  belongs_to :confirmed_user, :class_name => 'User', :foreign_key => "user_id"
  belongs_to :confirmed_event, :class_name => 'Event', :foreign_key => "event_id"	
end
