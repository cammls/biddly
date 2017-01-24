class Ability
  include CanCan::Ability

  def initialize(user)

      user ||= User.new # guest user (not logged in)
      if user.admin?
        can :manage, :all
      else
        can [:create, :show], User
        can [:update, :destroy], User, :id => user.id
        can [:index, :show], Product
        can :create, Product if user.id
        can [:update, :destroy], Product, :user_id => user.id
        can [:index, :show], Category

      end

  end
end
