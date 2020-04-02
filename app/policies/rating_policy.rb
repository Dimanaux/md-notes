class RatingPolicy < ApplicationPolicy
  def create?
    user.present?
  end

  def update?
    rating.user == user
  end

  def destroy?
    rating.user == user
  end

  def rating
    record
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
