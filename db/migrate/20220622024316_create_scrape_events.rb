class CreateScrapeEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :scrape_events do |t|
      t.boolean :success, null: false, default: false
      t.string :scraper, null: false

      t.timestamps
    end
  end
end
