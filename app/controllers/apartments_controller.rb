class ApartmentsController < ApplicationController
  expose(:floor_plans) { FloorPlan.includes(:current_price_data).order(community: :desc) }

  def index; end
end
