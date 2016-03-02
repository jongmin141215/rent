Argyle.configure do |config|
  config.key = ENV['public_key']       # Public key from Plaid
  config.secret = ENV['secret']   # Secret from Plaid
  config.customer_id = ENV['client_id']  # Client ID from Plaid
end
