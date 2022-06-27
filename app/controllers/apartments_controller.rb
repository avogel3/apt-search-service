class ApartmentsController < ApplicationController
  expose(:floor_plans) { FloorPlan.includes(:current_price_data, :price_histories).order(community: :desc) }
end
