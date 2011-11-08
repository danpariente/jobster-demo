class Group < ActiveRecord::Base
  
  has_many :memberships
  has_many :members, :class_name => 'User',
                     :through => :memberships
  has_many :pages, :as => :pageable	
  
  belongs_to :user
  belongs_to :wall
  
  after_create :create_wall
  after_create :add_activity
  
  def create_wall
    self.wall = Wall.create
    self.save
  end

  def add_activity
    Activity.create(:user_id => self.user.id, :activity_type => 'group', :text => "<a href='/user/#{self.user.username}'>#{self.user.formatted_name}</a> created a new group - <a href='/groups/#{self.id}'>#{self.name}</a>.")
  end  
end
