class OrdersCreateJob < ActiveJob::Base
  def perform(shop_domain:, webhook:)
    shop = Shop.find_by(shopify_domain: shop_domain)

    shop.with_shopify_session do
      webhook['note_attributes'].each do |attr|
        if attr['name'] == 'creator'
          binding.pry
          creator = Creator.find_by(code: attr['value'].downcase)
          order = Order.create(order_id: webhook['id'], creator: creator)
          binding.pry
        end
      end
    end
  end
end
