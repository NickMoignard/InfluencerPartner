class FixNilInPaidColumn < ActiveRecord::Migration[5.2]
  def change

    change_column_default :orders, :paid, from: nil, to: false

  end
end