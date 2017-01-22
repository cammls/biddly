class Ability
  include CanCan::Ability

  def initialize(user)

      user ||= User.new # guest user (not logged in)
      if user.admin?
        can :manage, :all
      else
        can [:create, :show], User
        can [:update, :destroy], User, :id => user.id
        # TOTO: PREVENT GUESTS FROM CREATING PRODUCTS
        can [:index, :show, :create], Product 
        can [:update, :destroy], Product, :user_id => user.id

      end

  end
end
