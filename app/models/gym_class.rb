class GymClass < ActiveRecord::Base
  has_one :scheduler

  validates :class_id, uniqueness: { scope: :day_of_week }
  enum day_of_week: [:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday]
end
