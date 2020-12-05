class JobsController < ApplicationController
  before_action :authenticate_user!
  def new
    @job = Job.new 
  end

  def create
    @job = Job.new(job_params)
    @job.user_id = current_user.id
    binding.pry
    if(@job.save)
      flash[:success] = "Job is posted successfully"
      redirect_to jobs_path
    else
      render 'new'
      flash[:error] = @job.errors.full_messages
    end
  end

  def edit
    @job = Job.find(params[:id])

  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      flash[:success] = "Job is updated successfully"
      redirect_to jobs_path
    else
      render 'edit'
      flash[:error] = @job.errors.full_messages
    end

  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    flash[:danger] = "Job is deleted successfully"
    redirect_to jobs_path

  end

  def index
    @jobs = Job.paginate(page: params[:page],per_page: 5)

  end

  def job_params
    params.require(:job).permit(:title,:description,:qualification,:experience,:salary,:job_address,:job_type,:job_city,:job_country,:employer_detail,:package_detail,:job_requirements,:employer_email,:avatar)

  end

  def show
    @job = Job.find(params[:id])
    @jobs = Job.all

  end

end