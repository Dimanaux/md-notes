class IpWhitelistConstraint
  def initialize
    @ips = ENV.fetch("IP_WHITELIST", "").split(",")
  end

  def matches?(request)
    ips.include?(ip(request))
  end

  private

  attr_reader :ips

  def ip(request)
    request.respond_to?(:remote_ip) ? request.remote_ip : request.ip
  end
end
