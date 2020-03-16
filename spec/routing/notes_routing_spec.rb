require "rails_helper"

describe Users::NotesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/users/user1/notes").to route_to("users/notes#index", user_username: "user1")
    end

    it "routes to #show" do
      expect(get: "/users/user1/notes/note-1").to route_to("users/notes#show", user_username: "user1", slug: "note-1")
    end
  end
end
