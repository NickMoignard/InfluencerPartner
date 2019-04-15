class RemoveCreatorFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :creator, :String
  end
end
