class CreateIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.integer :price
      t.datetime :expiration_date
      t.references :supermarket, null: false, foreign_key: true

      t.timestamps
    end
  end
end
