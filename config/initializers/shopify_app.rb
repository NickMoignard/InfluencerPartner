ShopifyApp.configure do |config|
  config.application_name = "Influencer Partner"
  config.api_key = ENV['API_KEY']
  config.secret = ENV['SECRET']
  config.scope = "read_orders, read_products" # Consult this page for more scope options:
                                 # https://help.shopify.com/en/api/getting-started/authentication/oauth/scopes
  config.embedded_app = true
  config.after_authenticate_job = false
  config.session_repository = Shop

  config.webhooks = [
    {topic: 'orders/create', address: 'https://influencer-partner.ngrok.io/webhooks/orders_create', format: 'json'},
  ]
end
