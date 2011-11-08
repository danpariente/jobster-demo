class Pending < ActiveRecord::Base
  belongs_to :pending_user, :class_name => 'User', :foreign_key => "user_id"
  belongs_to :pending_event, :class_name => 'Event', :foreign_key => "event_id"
end
