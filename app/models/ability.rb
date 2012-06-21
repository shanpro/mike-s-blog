class Ability
  include CanCan::Ability

  def initialize(user)
    #https://github.com/ryanb/cancan/wiki/defining-abilities
    #https://github.com/ryanb/cancan/wiki/checking-abilities
    case user.role_id
    when "admin" #管理员 目前就Eric一人
      can :manage, :all
    when "ba" #全BA
      can :read, [News, Calendar, LiveStory, Sales, Trainer, Coach, Product]
      can [:read, :create, :update], Ba
    when "common" #全公司内职员
      can :read, [News, Calendar, LiveStory, Sales, Trainer, Coach, Product]
      can [:create, :update], [News, LiveStory]
    when "si" #SI部门
      can :read, [News, Calendar, LiveStory, Sales, Trainer, Coach, Product]
      can [:create, :update], [Calendar, Sales, Trainer, Coach]
    when "sales" #销售部
      can :read, [News, Calendar, LiveStory, Sales, Trainer, Coach, Product]
      can [:create, :update], Sales
    when "edu" #美容教育部
      can :read, [News, Calendar, LiveStory, Sales, Trainer, Coach, Product]
      can [:create, :update], Product    
    end  
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
