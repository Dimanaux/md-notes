require "simplecov"

SimpleCov.start "rails" do
  add_filter "/.bundle"
  add_group "Decorators", "app/decorators"
  add_group "Interactors", "app/interactors"
end