module ApplicationHelper
	
  def time_ago_in_words(timestamp)
    minutes = (((Time.now - timestamp).abs)/60).round
      return nil if minutes < 0
	  case minutes
	    when 0 then 'less than a minute ago'
	    when 0..4 then 'less than 5 minutes ago'
	    when 5..14 then 'less than 15 minutes ago'
	    when 15..29 then 'less than 30 minutes ago'
	    when 30..59 then 'more than 30 minutes ago'
	    when 60..119 then 'more than 1 hour ago'
	    when 120..239 then 'more than 2 hours ago'
	    when 240..479 then 'more than 4 hours ago'
	  else timestamp.strftime('%I:%M %p %d-%b-%Y')
	  end
  end
  
  def people_who_likes 
    self.likes.collect { |like| "<a href='/user/#{like.user.username}'>#{like.user.formatted_name}</a>" }	
  end
  
  def gravatar_for(user) 
  	"#{user.photo_url.nil? ? "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email)}" : user.photo_url }"
  end
  		
end
