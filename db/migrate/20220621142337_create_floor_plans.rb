class CreateFloorPlans < ActiveRecord::Migration[7.0]
  def change
    create_table :floor_plans do |t|
      t.string :name, null: false
      t.string :community, null: false
      t.string :beds
      t.string :baths
      t.string :price
      t.date :available_at

      t.timestamps
    end

    add_index :floor_plans, %i[name community], unique: true
  end
end
