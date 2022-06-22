class ChangeStringColsToIntegerOnFloorPlans < ActiveRecord::Migration[7.0]
  def up
    change_column :floor_plans, :baths, 'integer using cast(baths as integer)'
    change_column :floor_plans, :beds, 'integer using cast(beds as integer)'
    change_column :floor_plans, :price, 'integer using cast(price as integer)'
    change_column :floor_plans, :sq_ft, 'integer using cast(sq_ft as integer)'
  end

  def down
    change_column :floor_plans, :baths, :string
    change_column :floor_plans, :beds, :string
    change_column :floor_plans, :price, :string
    change_column :floor_plans, :sq_ft, :string
  end
end
