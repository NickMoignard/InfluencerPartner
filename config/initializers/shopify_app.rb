ShopifyApp.configure do |config|
  config.application_name = "Influencer Partner"
  config.api_key = "0506d033f96cd1a2ecc6bd074d61b651"
  config.secret = "da336db92f9eff48a9df56b97b087d8e"
  config.scope = "read_orders, read_products" # Consult this page for more scope options:
                                 # https://help.shopify.com/en/api/getting-started/authentication/oauth/scopes
  config.embedded_app = true
  config.after_authenticate_job = false
  config.session_repository = Shop

  config.webhooks = [
    {topic: 'orders/create', address: 'https://influencer-partner.ngrok.io/webhooks/orders_create', format: 'json'},
  ]
end
