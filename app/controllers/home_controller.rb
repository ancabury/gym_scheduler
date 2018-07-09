class HomeController < ApplicationController
  def index
    @gym_classes = GymClass.all
  end
end
