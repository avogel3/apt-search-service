class ApartmentsController < ApplicationController
  expose(:floor_plans) { FloorPlan.includes(:current_price_data) }

  def index; end
end
