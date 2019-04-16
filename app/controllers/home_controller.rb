class HomeController < ShopifyApp::AuthenticatedController
  def index
    @products = ShopifyAPI::Product.find(:all, params: { limit: 10 })
    @webhooks = ShopifyAPI::Webhook.find(:all)
    @creators = Creator.all
    @orders = {}

    Creator.find_each do |c|
      @orders[c.code] = Order.where(:creator => c).where(:paid => false)
    end

  end
end
