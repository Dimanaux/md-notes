class SubscriptionPolicy < ApplicationPolicy
  def create?
    user.present?
  end

  def destroy?
    false
  end
end
