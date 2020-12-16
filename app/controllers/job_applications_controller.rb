class JobApplicationsController < ApplicationController
  before_action :authenticate_user!
  before_action :valid_user, only: [:destroy]
  before_action :valid_user1, only: [:edit,:update]


  def new
    @job_application = JobApplication.new()
    @job_application.job_id = params[:current_job_id]
  end

  def create
    @job_application = JobApplication.new(application_params)
    @job_application.user_id = current_user.id
    if(@job_application.save) 
      flash[:success] = "Your application is submitted successfully"
      redirect_to jobs_path
    else
      render "new"
    end

  end

  def edit
    @job_application = JobApplication.find(params[:id])

  end

  def update
    @job_application = JobApplication.find(params[:id])
    if @job_application.update(application_params)
      flash[:success] = "Application is updated successfully"
      redirect_to my_applications_path
    else
      render 'edit'
      flash[:error] = @job_application.errors.full_messages
    end
  end

  def destroy
    @job_application = JobApplication.find(params[:id])
    @job_application.destroy
    flash[:danger] = "Application is deleted successfully"
    redirect_to my_applications_path
  end

  def valid_user
    @job_application = JobApplication.find(params[:id])
    if current_user !=  @job_application.user && current_user != @job_application.job.user
      flash[:danger]= "You cannot perform this action"
      redirect_to root_path
    end

  end


  def valid_user1
    @job_application = JobApplication.find(params[:id])
    if current_user !=  @job_application.user
      flash[:danger]= "You cannot perform this action"
      redirect_to root_path
    end

  end

  def index
    @job_applications = JobApplication.joins(:job).where(jobs: {user_id: current_user.id}).where.not(job_id: nil).paginate(page: params[:page],per_page: 5)

    
  end

  def my_applications
    @my_applications = JobApplication.where(user_id: current_user.id).where.not(job_id: nil).paginate(page: params[:page],per_page: 5)
  end



  def application_params
    params.require(:job_application).permit(:name,:age,:qualification,:experience,:skills,:personalinfo,:job_id,:file,:avatar,:address,:city,:country,:experience_detail,:qualification_detail,:previous_company,:applicant_email)

  end

  def show
    @applicant = JobApplication.find(params[:id])

  end
end
