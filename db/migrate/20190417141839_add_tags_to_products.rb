class AddTagsToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :tags, :string
    add_column :products, :price, :float
  end
end
