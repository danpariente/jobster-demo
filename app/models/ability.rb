class Ability 
	include CanCan::Ability
		
	def initialize(user) 
	  user ||= User.new 	
		
	  if user.role? :admin
	    can :manage, :all 		
	  else
	    can :manage, :all 		
	     #can :read, :all		
	  end
	  if user.role? :jobseeker
	  	can :manage, :all
	    #can :read, @Page		  	 	
	  end	 
	  if user.role? :employer
	  	can :manage, :all
	    #can :create, @Page
	    #can :update, @Page		  	 	
	  end	 
	end
end