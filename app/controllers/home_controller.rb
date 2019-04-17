class HomeController < ShopifyApp::AuthenticatedController
  def index
    @products = ShopifyAPI::Product.find(:all, params: { limit: 10 })
    @webhooks = ShopifyAPI::Webhook.find(:all)
    @orders = {}
    @creators = Creator.all

    Creator.all.each do |c|
      @orders[c.code] = Order.where(:creator => c).where(:paid => false)
    end

    creator_orders_value(@creators.first)
    
  end

  def payout
    #RAKIBUL
    if params[:code].nil? 
      puts 'Code parameter is nil'
    else
      creator = Creator.find_by(code: params[:code])
      PayoutCreatorJob.perform_now(creator)
    end
  end

  private

  def creator_orders_value(creator)
    #RAKIBUL

    creator_orders = Order.where(creator: creator)
    store_orders = []
    total_price_usd = 0.0

    creator_orders.each do |o|
      store_orders.append(ShopifyAPI::Order.find(o.order_id))
    end
    store_orders.each do |o|
      total_price_usd = total_price_usd + o.total_price_usd.to_f
    end

    return total_price_usd
  end


end
