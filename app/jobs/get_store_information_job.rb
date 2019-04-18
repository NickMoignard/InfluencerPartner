class GetStoreInformationJob < ApplicationJob
  include ApplicationHelper
  queue_as :default

  def perform(shop_domain)
    shop = Shop.find_by(:shopify_domain => shop_domain)
    shop.with_shopify_session do

      products = ShopifyAPI::Product.find(:all)
      products.each do |product|
        Product.create(:name => product.title, :tags => product.tags, :price => product.variants.first.price, :item_id => product.id )
      end

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
    end
  end
end
