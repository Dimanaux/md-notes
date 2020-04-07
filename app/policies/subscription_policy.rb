class SubscriptionPolicy < ApplicationPolicy
  def create?
    !subscribed?
  end

  def destroy?
    subscribed?
  end

  def other_user
    record
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
