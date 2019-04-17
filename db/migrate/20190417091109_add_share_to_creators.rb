class AddShareToCreators < ActiveRecord::Migration[5.2]
  def change
    add_column :creators, :share, :float, :default => 10.0, :from => nil, :to => 10.0
  end
end
