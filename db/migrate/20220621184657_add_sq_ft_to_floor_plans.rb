class AddSqFtToFloorPlans < ActiveRecord::Migration[7.0]
  def change
    add_column :floor_plans, :sq_ft, :string
  end
end
