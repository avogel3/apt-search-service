class RemovePriceFromFloorPlan < ActiveRecord::Migration[7.0]
  def change
    remove_column :floor_plans, :price
  end
end
