class CreateVariants < ActiveRecord::Migration[5.2]
  def change
    create_table :variants do |t|
      t.integer :quantity
      t.integer :inventory_item_id
      t.integer :variant_id
      t.string :title
      t.references :product, foreign_key: true, index: true

      t.timestamps
    end
  end
end
