class GetStoreInformationJob < ApplicationJob
  include ApplicationHelper
  queue_as :default

  def perform(shop_domain)

    puts '~ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ~'
    puts 'GetStoreInformationJob Triggered'
    puts '~ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ~'
  

    shop = Shop.find_by(:shopify_domain => shop_domain)
    shop.init = true
    shop.save
    
    shop.with_shopify_session do

      products = ShopifyAPI::Product.find(:all)
      products.each do |product|
        Product.create(:name => product.title, :tags => product.tags, :price => product.variants.first.price, :item_id => product.id )
      end


      currently_tracked_orders = Order.pluck(:order_id)

      store_orders = ShopifyAPI::Order.find(:all)
      store_orders.each do |o|
        o.note_attributes.each do |attr|
          if attr.name == 'creator'
            puts attr.value
            if !currently_tracked_orders.include? o.id
              creator = Creator.find_by(code: attr.value.downcase)
              if creator.nil?
                # incorrect creator code
               # don't save order
              else
                shopify_order = ShopifyAPI::Order.find(o.id)
                order_value = 0.0

                shopify_order.line_items.each do |item|
                  product = Product.find_by(:name => item.title)
                  tags = product.tags.split(', ')
                  ProductTag.all.each do |t|
                    if tags.include? t.tag
                      # do not add to total
                      order_value = order_value - 100
                    else
                      order_value = order_value + item.price.to_f
                    end
                  end
                end
                order = Order.create(order_id: o.id, creator: creator, value: order_value)
              end
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
