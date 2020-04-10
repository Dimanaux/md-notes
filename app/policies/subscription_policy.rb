class SubscriptionPolicy < ApplicationPolicy
  def create?
    signed_in? && !subscribed?
  end

  def destroy?
    signed_in? && subscribed?
  end

  private

  def subscribed?
    user.subscribed_to?(record.followee)
  end
end
