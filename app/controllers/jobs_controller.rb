class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]

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

  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
    end
  end

  private

  def set_job
    @job = Job.find(params[:id]).decorate
  end

  def job_params
    params.require(:job).permit(:title)
  end
end
