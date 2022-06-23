class AddListingLinkToFloorPlans < ActiveRecord::Migration[7.0]
  def change
    add_column :floor_plans, :listing_link, :string
  end
end
