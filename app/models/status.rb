class Status < ActiveRecord::Base
  belongs_to :recipient, :class_name => 'User', :foreign_key => 'recipient_id'	
  belongs_to :user
  
  has_many :comments, :as => :commentable 	
  has_many :likes, :as => :likeable 
  has_many :mentions
  has_many :mentioned_users, :class_name => 'User',
                             :through => :mentions, 
                             :foreign_key => 'user_id'	
  before_save :init
  after_save :continuation
  
  URL_REGEXP = Regexp.new('\b ((https?|telnet|gopher|file|wais|ftp) : [\w/#~:.?+=&%@!\-] +?) (?=[.:?\-] * (?: [^\w/#~:.?+=&%@!\-]| $ ))', Regexp::EXTENDED)
  AT_REGEXP = Regexp.new('@[\w.@_-]+', Regexp::EXTENDED)	
                             
  def init
    @mentions = []
    process
  end

  def continuation
    unless @mentions.nil?
      @mentions.each {|m|
        m.status = self 
        m.save 
      }
    end
    Activity.create(:user_id => user.id, :activity_type => 'status', :text => self.text )
  end

  # general scrubbing 
  def process
    # process url
    urls = self.text.scan(URL_REGEXP)
    urls.each { |url|
      tiny_url = RestClient.get "http://tinyurl.com/api-create.php?url=#{url[0]}"    
      self.text.sub!(url[0], "<a href='#{tiny_url}'>#{tiny_url}</a>")
    }        
    # process @
    ats = self.text.scan(AT_REGEXP)
    ats.each { |at| 
      user = User.where(:username => at[1,at.length]).first
      if user
        self.text.sub!(at, "<a href='/user/#{user.username}'>#{at}</a>") 
        @mentions << Mention.new(:user => user, :status => self)
      end      
    }            
  end

  def starts_with?(prefix)
    prefix = prefix.to_s
    self.text[0, prefix.length] == prefix
  end  
  
  def to_json(*a)
    {'id' => id, 'text' => text, 'created_at' => created_at, 'user' => user.username}.to_json(*a)
  end                             
end
