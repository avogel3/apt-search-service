namespace :scrape do
  desc 'Executes the scrape services for Allister and Duvall if before 09/01/2022'
  task start: :environment do
    target_date = '09/01/2022'
    return if Date.strptime(target_date, '%m/%d/%Y').past?

    puts 'Scraping....'

    DuvallWestside::Scraper.new(target_date).call
    AllisterColumbia::Scraper.new(target_date).call
  end
end
