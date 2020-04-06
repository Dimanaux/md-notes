require "rails_helper"

describe Notes::Update do
  include_examples "organized with", [
    Notes::AssignAttributes,
    Notes::UpdateSlug
  ]
end
