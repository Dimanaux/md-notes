class NotePolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.present?
  end

  def update?
    author?
  end

  def destroy?
    author?
  end

  def author?
    user.present? && note.author == user
  end

  def note
    record
  end
end
