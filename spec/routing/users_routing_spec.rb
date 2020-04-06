require "rails_helper"

describe UsersController, type: :routing do
  describe "routing" do
    it "routes to #show" do
      expect(get: "/users/user123").to route_to("users#show", id: "user123")
    end
  end
end
