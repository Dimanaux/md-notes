module Internationalization
  extend ActiveSupport::Concern

  included do
    around_action :switch_locale
  end

  def switch_locale(&action)
    I18n.with_locale(current_user&.locale || I18n.default_locale, &action)
  end
end
