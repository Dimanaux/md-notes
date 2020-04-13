class NotePolicy < ApplicationPolicy
  def create?
    true
  end

  def update?
    user == record.author
  end

  def destroy?
    update?
  end
end
