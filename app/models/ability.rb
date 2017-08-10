class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user || User.new # for guest
    @user.roles.each { |role| send(role) }
  end

  def admin
    can :manage, User
    can :manage, Warehouse
    user
  end

  def user
    can :manage, Treasure
  end
end
