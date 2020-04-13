class NotePolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

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
