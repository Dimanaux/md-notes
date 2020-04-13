class ApplicationPolicy < ActionPolicy::Base
  authorize :user, allow_nil: true

  alias_rule :new?, to: :create?
  alias_rule :edit?, to: :update?

  def signed_in?
    user.present?
  end
end
