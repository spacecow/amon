class Ability  
  include CanCan::Ability  
  
  def initialize(user)  
		if user == "admin"
			can :manage, :all
		elsif
			can :create, User
			can :show, Page
			
			user ||= User.new
			if user.role? :registrant
				can :show, User do |u|
					u == user
				end
			end
		end
  end  
end