class ApartmentsController < ApplicationController
  expose(:floor_plans) { FloorPlan.order(price: :asc) }

  def index; end
end
