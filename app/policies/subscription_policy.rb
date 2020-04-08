class SubscriptionPolicy < ApplicationPolicy
  def create?
    user && !subscribed?
  end

  def destroy?
    user && subscribed?
  end

  def other_user
    record.followee
  end

  def subscribed?
    user.decorate.subscribed_to?(other_user)
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
