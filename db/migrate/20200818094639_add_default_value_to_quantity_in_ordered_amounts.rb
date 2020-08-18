class AddDefaultValueToQuantityInOrderedAmounts < ActiveRecord::Migration[6.0]
  def change
    change_column :ordered_amounts, :quantity, :float, :default => 0.00
  end
end
