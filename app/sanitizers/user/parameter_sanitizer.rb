class User
  class ParameterSanitizer < Devise::ParameterSanitizer
    USER_PARAMS = %i[
      username
      email
      password
      password_confirmation
    ].freeze

    def initialize(*)
      super
      permit(:sign_up, keys: USER_PARAMS)
      permit(:account_update, keys: USER_PARAMS)
    end
  end
end
