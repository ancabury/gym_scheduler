class SchedulerController < ApplicationController
  before_action :load_gym_class
  before_action :load_scheduler, only: :destroy

  def new
    @scheduler = Scheduler.new(gym_class: @gym_class)
  end

  def create
    @scheduler = Scheduler.new(scheduler_params.merge(gym_class: @gym_class, user_id: current_user.id))
    if @scheduler.valid?
      @scheduler.save!
      # AddCronJob.new(current_user.id, @scheduler).perform
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    # DeleteCronJob.new(@scheduler).perform
    @scheduler.destroy
    redirect_to root_path
  end

  private

  def scheduler_params
    params.require(:scheduler).permit(:minute, :hour, :day_of_month, :month, :day_of_week)
  end

  def load_scheduler
    @scheduler = Scheduler.find(params[:id])
  end

  def load_gym_class
    @gym_class = GymClass.find(params[:gym_class_id])
  end
end
