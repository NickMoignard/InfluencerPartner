class RemoveInventoryFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :inventory, :integer
  end
end
