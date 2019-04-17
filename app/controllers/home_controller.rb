class HomeController < ShopifyApp::AuthenticatedController
  helper ApplicationHelper

  def index
    @products = ShopifyAPI::Product.find(:all, params: { limit: 10 })
    @webhooks = ShopifyAPI::Webhook.find(:all)
    @creator_orders = {}
    @creators = Creator.all
    Creator.all.each do |c|
      @creator_orders[c.code] = Order.where(:creator => c).where(:paid => false)
    end
    check_for_fresh_install_and_update_orders_db
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

    creator_orders = Order.where(:creator => Creator.find_by( :code => creator ) )
    store_orders = []
    total_price_usd = 0.0

    creator_orders.each do |o|
      store_orders.append(ShopifyAPI::Order.find(o.order_id))
    end
    store_orders.each do |o|
      o.line_items.each do |item|
        product = ShopifyAPI::Product.find(item.product_id)
        tags = product.tags.split(', ')
        ProductTag.all.each do |t|
          if tags.include? t.tag
            # do not add to total
          else
            total_price_usd = total_price_usd + 1
          end
        end
      end

      
    end

  
    return total_price_usd
  end
  helper_method :creator_orders_value


  def check_for_fresh_install_and_update_orders_db
    if Order.all.length < 1
      # fresh install
      store_orders = ShopifyAPI::Order.find(:all)
      store_orders.each do |o|
        o.note_attributes.each do |attr|
          if attr.name == 'creator'
            creator = Creator.find_by(code: attr.value.downcase)
            
            if creator.nil?
              # incorrect creator code
              # don't save order
            else
              order = Order.create(order_id: o.id, creator: creator)
            end
          else
            puts '=================================='
            puts 'additional note_attribute found! :'
            puts attr.name
            puts '=================================='
          end
        end
      end
    else
      # not a new install  
    end 
  end
end
