require "webdrivers"

class CommunityFloorplanScraper
  attr_reader :community

  def initialize(community:)
    @community = community
  end

  delegate(:floorplan_url, to: :community)

  def self.call(...)
    new(...).perform
  end

  def perform
    browser.headers.set("User-Agent" => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36")

    browser.goto floorplan_url
    browser.css(".fp-container")
    browser.quit
  end

  private

  def search_form
    browser.at_css("form#aptsearch")
  end

  def browser
    @browser ||= Ferrum::Browser.new
  end
end
