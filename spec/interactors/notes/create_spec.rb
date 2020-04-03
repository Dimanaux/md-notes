require "rails_helper"

describe Notes::Create do
  include_examples "organized with", [
    Notes::UpdateSlug,
    Subscriptions::Notify
  ]
end
