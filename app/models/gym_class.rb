class GymClass < ActiveRecord::Base
  has_one :scheduler

  validates_uniqueness_of :platform_id
  enum day_of_week: [:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday]
end
