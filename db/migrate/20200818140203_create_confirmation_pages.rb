class CreateConfirmationPages < ActiveRecord::Migration[6.0]
  def change
    create_table :confirmation_pages do |t|
      t.references :basket, null: false, foreign_key: true

      t.timestamps
    end
  end
end
