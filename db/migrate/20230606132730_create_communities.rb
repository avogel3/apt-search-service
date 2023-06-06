class CreateCommunities < ActiveRecord::Migration[7.0]
  def change
    create_table :communities do |t|
      t.text :name, null: false
      t.text :floorplan_url, null: false

      t.timestamps
    end
  end
end
