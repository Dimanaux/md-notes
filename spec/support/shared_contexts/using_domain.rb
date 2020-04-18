shared_context "when using domain" do |domain|
  before do
    Rails.application.routes.default_url_options[:host] = domain
  end
end
