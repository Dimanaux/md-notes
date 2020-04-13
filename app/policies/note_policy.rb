class NotePolicy < ApplicationPolicy
  def create?
    signed_in?
  end

  def update?
    signed_in? && user == record.author
  end

  def destroy?
    update?
  end
end
