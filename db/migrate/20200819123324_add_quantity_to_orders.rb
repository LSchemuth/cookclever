class AddQuantityToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :quantity, :integer, default: 1
  end
end
