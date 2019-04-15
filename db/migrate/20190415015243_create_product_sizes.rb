class CreateProductSizes < ActiveRecord::Migration[5.2]
  def change
    create_table :product_sizes do |t|
      t.string :name
      t.integer :collection_id

      t.timestamps
    end
  end
end
