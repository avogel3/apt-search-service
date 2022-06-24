require 'rails_helper'

RSpec.describe 'Floor Plan Price History', type: :system do
  let(:floor_plan) { FactoryBot.create(:floor_plan) }

  context 'one price history record' do
    before do
      FactoryBot.create(:price_history, floor_plan: floor_plan, price: 469)
    end

    scenario 'visitor views price histories for a floor plan' do
      visit floor_plan_path(floor_plan)

      expect(page).to have_content 'Price History'
      expect(page).to have_content 'Current Price - $469'
    end
  end

  context 'multiple price history records' do
    before do
      FactoryBot.create(:price_history, floor_plan: floor_plan, price: 469)
      FactoryBot.create(:price_history, floor_plan: floor_plan, price: 600)
    end

    scenario 'visitor views price histories for a floor plan' do
      visit floor_plan_path(floor_plan)

      expect(page).to have_content 'Price History'
      expect(page).to have_content 'High - $600'
      expect(page).to have_content 'Low - $469'
    end
  end
end
