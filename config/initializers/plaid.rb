Plaid.config do |p|
  p.customer_id = ENV['client_id']
  p.secret = ENV['secret']
  p.environment_location = 'https://tartan.plaid.com/'
  # i.e. 'https://tartan.plaid.com/' for development, or
  # 'https://api.plaid.com/' for production
end
