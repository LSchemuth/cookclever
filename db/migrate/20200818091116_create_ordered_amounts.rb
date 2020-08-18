class CreateOrderedAmounts < ActiveRecord::Migration[6.0]
  def change
    create_table :ordered_amounts do |t|
      t.references :ingredient, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.integer :quantity, default: 0.00

      t.timestamps
    end
  end
end
