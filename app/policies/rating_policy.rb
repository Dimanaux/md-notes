class RatingPolicy < ApplicationPolicy
  def create?
    true
  end

  def update?
    user == record.user
  end

  def destroy?
    update?
  end
end
