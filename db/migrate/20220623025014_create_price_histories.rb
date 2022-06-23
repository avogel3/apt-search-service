class CreatePriceHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :price_histories do |t|
      t.integer :price
      t.references :floor_plan, null: false, foreign_key: true

      t.timestamps
    end
  end
end
