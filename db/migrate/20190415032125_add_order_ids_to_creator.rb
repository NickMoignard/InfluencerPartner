class AddOrderIdsToCreator < ActiveRecord::Migration[5.2]
  def change
    add_column :creators, :order_ids, :resources
  end
end
