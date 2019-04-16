class PayoutCreatorJob < ApplicationJob
  queue_as :urgent

  def perform(creator)
    #pass a creator object


    creator_orders = Order.where(creator: creator)
    creator_orders.each do |order|
      order.paid = true
      order.save
    end 
  end
end
