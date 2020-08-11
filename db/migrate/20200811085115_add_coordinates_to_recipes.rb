class AddCoordinatesToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :latitude, :float
    add_column :recipes, :longitude, :float
  end
end
