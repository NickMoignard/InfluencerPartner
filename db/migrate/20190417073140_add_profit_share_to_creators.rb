class AddProfitShareToCreators < ActiveRecord::Migration[5.2]
  def change
    add_column :creators, :profit_share, :integer, :default => :profit, :from => nil, :to => :profit
    add_index :creators, :profit_share
  end
end
