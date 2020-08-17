class ChangeQuantityToBeFloatInAmounts < ActiveRecord::Migration[6.0]
  def change
    change_column :amounts, :quantity, :float
  end
end
