class JobsController < ApplicationController
  before_action :set_job, only: [:destroy_intention, :show, :edit, :update, :destroy]

  def index
    @jobs = Job.order(updated_at: :desc).decorate
  end

  def show
  end

  def new
    @job = Job.new.decorate
  end

  def edit
  end

  def create
    @job = Job.new(job_params)
    @job.user = current_user
    if @job.save
      redirect_to @job
    else
      render :new
    end
  end

  def update
    if @job.update(job_params)
      redirect_to @job
    else
      render :edit
    end
  end

  def destroy_intention; end

  def destroy
    @job.destroy
    redirect_to jobs_path
  end

  private

  def set_job
    @job = Job.find(params[:id]).decorate
  end

  def job_params
    params.require(:job).permit(:title)
  end
end
