class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
		user ||= User.new # guest user (not logged in)
		if user.role_id == Ittasks::Application::ADMIN_ROLE
			can :manage, :all
		elsif user.role_id == Ittasks::Application::USER_ROLE
			can [:update, :destroy, :my_tasks], Task, :principal_id => user.id
			can [:create, :read], Task
			can [:read, :accept], Offer
		elsif [Ittasks::Application::ABO1_ROLE, Ittasks::Application::ABO2_ROLE, Ittasks::Application::ABO3_ROLE].include?user.role_id
			can [:update, :destroy, :my_tasks], Task, :principal_id => user.id
			can [:create, :read], Task
			can [:update, :destroy, :my_offers], Offer, :user_id => user.id
			can [:read, :create, :accept], Offer
		else 
			can :read, :all
		end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
