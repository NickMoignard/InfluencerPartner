class OrdersCreateJob < ActiveJob::Base
  def perform(shop_domain:, webhook:)
    shop = Shop.find_by(shopify_domain: shop_domain)

    shop.with_shopify_session do
      webhook['note_attributes'].each do |attr|
        if attr['name'] == 'creator'

          creator = Creator.find_by(code: attr['value'].downcase)
          
          if creator.nil?
            # incorrect creator code
            # don't save order
          else
            order = Order.create(order_id: webhook['id'], creator: creator)
          end
        else
          puts '=================================='
          puts 'additional note_attribute found! :'
          puts attr['name']
          puts '=================================='
        end
      end
    end
  end
end
