class AddInitToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :init, :boolean, :default => false, :from => nil, :to => false
  end
end
