class Profile < ActiveRecord::Base
  belongs_to :user
  has_one :preference
  has_many :educations
  has_many :experiences
  has_many :competencies
  has_many :languages
  has_many :references
end
