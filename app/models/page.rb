class Page < ActiveRecord::Base
  
  has_many :comments, :as => :commentable		
  has_many :likes, :as => :likeable
  
  belongs_to :user
  belongs_to :pageable, :polymorphic  => true
	
  validates_presence_of :title, :body
  validates_length_of :title, :within => 3..255
  validates_length_of :body, :maximum => 10000
    
  after_create :add_activity

  def add_activity
    if self.pageable_type == 'Event'
      Activity.create(:user_id => self.user.id, :activity_type => 'event page', :text => "<a href='/user/#{self.user.username}'>#{self.user.formatted_name}</a> created a page - <a href='/events/#{self.pageable_id}/pages/#{self.id}'>#{self.title}</a> for the event <a href='/events/#{self.pageable_id}'>#{self.pageable.name}</a>.") 
    elsif self.pageable_type == 'Group'
      Activity.create(:user_id => self.user.id, :activity_type => 'group page', :text => "<a href='/user/#{self.user.username}'>#{self.user.formatted_name}</a> created a page - <a href='/groups/#{self.pageable_id}/pages/#{self.id}'>#{self.title}</a> for the group <a href='/groups/#{self.pageable_id}'>#{self.pageable.name}</a>.")       
    else
      Activity.create(:user_id => self.user.id, :activity_type => 'page', :text => "<a href='/user/#{self.user.username}'>#{self.user.formatted_name}</a> created a page - <a href='/pages/#{self.id}'>#{self.title}</a>.")
    end
  end
    
    def before_create
      @attributes['permalink'] =
      title.downcase.gsub(/\s+/, '_').gsub(/[^a-zA-Z0-9_]+/, '')
    end
    
    def to_param
	  "#{id}-#{permalink}"
    end
end
