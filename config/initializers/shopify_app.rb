ShopifyApp.configure do |config|
  config.application_name = "Influencer Partner"
  config.api_key = "20c18c2ed0e41f4701c318e58a3d211a"
  config.secret = "a8ff46ab0475fba0fcdf0207f615516b"
  config.scope = "read_orders, read_products" # Consult this page for more scope options:
                                 # https://help.shopify.com/en/api/getting-started/authentication/oauth/scopes
  config.embedded_app = true
  config.after_authenticate_job = false
  config.session_repository = Shop

  config.webhooks = [
    {topic: 'orders/create', address: 'https://influencer-partner.ngrok.io/webhooks/orders_create', format: 'json'},
  ]
end


shop_url = "https://20c18c2ed0e41f4701c318e58a3d211a:a8ff46ab0475fba0fcdf0207f615516b@cool-shirtz.myshopify.com"
ShopifyAPI::Base.site = shop_url