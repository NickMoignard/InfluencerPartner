class AddCreatorToOrder < ActiveRecord::Migration[5.2]
  def change
    add_reference :orders, :creator, foreign_key: true
  end
end
