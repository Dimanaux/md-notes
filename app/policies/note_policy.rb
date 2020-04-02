class NotePolicy < ApplicationPolicy
  def create?
    user.present?
  end

  def update?
    note.user == user
  end

  def destroy?
    note.user == user
  end

  def note
    record
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
