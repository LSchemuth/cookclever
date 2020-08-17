class ChangePriceToBeFloatInIngredients < ActiveRecord::Migration[6.0]
  def change
    change_column :ingredients, :price, :float
  end
end
