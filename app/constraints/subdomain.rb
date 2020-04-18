class Subdomain
  def self.matches?(request)
    subdomain = request.subdomain
    subdomain.present? && subdomain.length > 3
  end
end
