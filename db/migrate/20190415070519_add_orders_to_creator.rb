class AddOrdersToCreator < ActiveRecord::Migration[5.2]
  def change
    add_reference :creators, :orders, foreign_key: true
  end
end
