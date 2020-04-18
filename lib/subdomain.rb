class Subdomain
  def self.matches?(request)
    subdomain = request.subdomain
    return false unless subdomain.present? && valid?(subdomain)

    set_param(request.params, subdomain)
    true
  end

  FORBIDDEN_SUBDOMAINS = %w[api www].freeze

  def self.valid?(subdomain)
    !FORBIDDEN_SUBDOMAINS.include?(subdomain) &&
      User.exists?(username: subdomain)
  end

  def self.set_param(params, subdomain)
    if params[:controller] == "users"
      params[:id] = subdomain
    else
      params[:user_id] = subdomain
    end
  end
end
