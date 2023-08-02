class JobsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy, ]
  load_and_authorize_resource

  def index
    if user_signed_in? && current_user.admin
      @job = Job.all
    else
      @job = Job.all.where(status: :published)
    end
  end
  def new
    @job = Job.new
  end
  
  def create
    @job = current_user.jobs.new(job_params)
    
    if @job.save
      redirect_to jobs_path, success: 'Job was successfully created.'
    else
      render :new
    end
  end

  def show 
    @job = Job.find(params[:id])
  end

  def edit
    @job = Job.find(params[:id]) 
   end

  def update
    
    @job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to jobs_path
    else
      render :edit
    end

  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to jobs_path
  end

  private 

  def job_params
    params.require(:job).permit(:title, :description, :status)
  end

  
end
