class HomeController < ShopifyApp::AuthenticatedController
  def index
    @products = ShopifyAPI::Product.find(:all, params: { limit: 10 })
    @webhooks = ShopifyAPI::Webhook.find(:all)
    @orders = {}
    @creators = Creator.all

    Creator.all.each do |c|
      @orders[c.code] = Order.where(:creator => c).where(:paid => false)
    end
  end

  def payout
    if params[:code].nil? 
      puts 'Code parameter is nil'
    else
      creator = Creator.find_by(code: params[:code])
      PayoutCreatorJob.perform_now(creator)
    end
  end

end
