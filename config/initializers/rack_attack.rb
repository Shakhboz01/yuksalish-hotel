class Rack::Attack
  cache.store = ActiveSupport::Cache::MemoryStore.new

  throttle('req/ip', limit: 5, period: 22.seconds) do |req|
    if req.path == '/users/sign_in' && req.post?
      req.ip
    end
  end

  throttle('logins/email', limit: 5, period: 20.seconds) do |req|
    if req.path == '/users/sign_in' && req.post?
      # Normalize the email, using the same logic as your authentication process, to
      # protect against rate limit bypasses. Return the normalized email if present, nil otherwise.
      req.params['email'].to_s.downcase.gsub(/\s+/, "").presence
    end
  end
end
