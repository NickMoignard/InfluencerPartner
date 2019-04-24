class HomeController < ActionController::Base
  helper ApplicationHelper

  def index

    # @products = ShopifyAPI::Product.find(:all, params: { limit: 10 })
    # @webhooks = ShopifyAPI::Webhook.find(:all)

    @creators = Creator.all
    @creators.includes(:orders)

    # unless old_install?
    GetStoreInformationJob.perform_later('cool-shirtz.myshopify.com')
    # end
  end

  def payout
    #RAKIBUL
    if params[:code].nil? 
      flash[:error] = "No code sent in URL Parameters"
    else
      creator = Creator.find_by(code: params[:code])
      PayoutCreatorJob.perform_now(creator)
      flash[:success] = "Generating report now"
    end
    render
  end


  def creator_orders_value(creator)
    #RAKIBUL

    store_orders = []
    total_price_usd = 0.0

    creator.orders.each do |o|
      total_price_usd += o.value
    end

    return total_price_usd
  end
  helper_method :creator_orders_value


  def old_install?
    Shop.find_by(:shopify_domain => session[:shopify_domain]).init
  end
end
