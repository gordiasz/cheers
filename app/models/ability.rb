class Ability  
  include CanCan::Ability  

  def initialize(user)  
    user ||= User.new  

if user.role? :admin
  can :manage, :all
elsif user.role? :author
  can :read, Coctail
  can :create, Coctail
  can [:update, :destroy], Coctail :user_id => user.id
elsif user.role? :moderator
  can :read, Coctail
  can [:update, :destroy], Coctail
else
  can :read, Coctail
    end
  end  
end  

