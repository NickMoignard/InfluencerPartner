class AddValueToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :value, :float, :default => -1.0, :from => nil, :to => -69.0
  end
end
