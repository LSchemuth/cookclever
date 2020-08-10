class CreateBaskets < ActiveRecord::Migration[6.0]
  def change
    create_table :baskets do |t|
      t.datetime :pickup_time
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
