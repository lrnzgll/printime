class PeriodsController < ApplicationController
  before_action :set_job, only: [:create, :stop]
  before_action :set_period, only: [:stop]

  def index
    @periods = current_user.periods
    policy_scope(@periods)
  end

  def create
    period = current_user.periods.new(
      start_time: Time.zone.now,
      job: @job
    )
    authorize(period)
    period.save || flash[:error] = "Errore. Riprova"
    redirect_to jobs_path
  end

  def stop
    @period.stop || flash[:error] = "Errore. Riprova"
    authorize(@period)
    redirect_to jobs_path
  end

  private

  def set_period
    @period = current_user.periods.find(params[:id])
  end

  def set_job
    @job = current_user.jobs.find(params[:job_id])
  end

  def pundit_user
    OpenStruct.new(
      user: current_user,
      job: @job
    )
  end
end
