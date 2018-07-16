class HomeController < ApplicationController
  def index
    @gym_classes = GymClass.all.order(day_of_week: :asc)
  end
end
