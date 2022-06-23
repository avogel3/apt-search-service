namespace :data do
  desc 'Migrate prices to price histories from floor plans'
  task migrate_price_to_price_history: :environment do
    return unless FloorPlan.column_names.include? 'price'

    puts 'Migrating...'

    prices = FloorPlan.pluck(:id, :price).map do |id, price|
      { 'floor_plan_id' => id, 'price' => price }
    end

    inserted = PriceHistory.insert_all(prices)
    puts "#{inserted.count} prices inserted..."
  end
end
