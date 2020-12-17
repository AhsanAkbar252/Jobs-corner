require 'will_paginate/array'
class JobsController < ApplicationController
  before_action :authenticate_user!
  before_action :valid_user, only: [:edit,:update,:destroy]
  def new
    @job = Job.new 
  end

  def create
    @job = Job.new(job_params)
    @job.user_id = current_user.id
    if @job.user.jobs.count <= 4
      if(@job.save)
        flash[:success] = "Job is posted successfully"
        redirect_to jobs_path
      else
        render 'new'
      end
    else
      flash[:danger] = "You cannot post more than 5 jobs at a time"
      render 'new'
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
    @job_applications = JobApplication.all
    @job_applications.each do|job_applications|
      @job.job_applications.each do|app|
        if job_applications == app
          job_applications.destroy
        end
      end
    end
    @job.job_applications.destroy
    flash[:danger] = "Job is deleted successfully"
    redirect_to jobs_path

  end

  def valid_user
    @job = Job.find(params[:id])
    if current_user !=  @job.user
      flash[:danger]= "You cannot perform this action"
      redirect_to root_path
    end

  end

  def index
    # @jobs = Job.paginate(page: params[:page],per_page: 5)
    @jobs = Job.all
    if params[:country].present? || params[:city].present? || params[:type].present? || params[:job_salary].present? || params[:keywords].present?
      if params[:keywords].present?
        @jobs = @jobs.where("lower(title) like ?","%#{params[:keywords].downcase}%")
      end
      if params[:country].present?
        @jobs = @jobs.where(job_country: params[:country])
      end
      if params[:city].present?
        @jobs = @jobs.where(job_city: params[:city])
      end
      if params[:type].present?
        @jobs = @jobs.where(job_type: params[:type])
      end
      if params[:job_salary].present?
        @jobs = @jobs.where("salary > ?",params[:job_salary])
      end
      @jobs = @jobs.paginate(page: params[:page],per_page: 5)
    else
      @jobs = @jobs.paginate(page: params[:page],per_page: 5)
    end

  end

  def job_params
    params.require(:job).permit(:title,:description,:qualification,:experience,:salary,:job_address,:job_type,:job_city,:job_country,:employer_detail,:package_detail,:job_requirements,:employer_email,:avatar)
  end

  def show
    @job = Job.find(params[:id])
    @jobs = Job.all

  end

  def my_jobs
    @my_jobs = Job.where(user_id: current_user.id).paginate(page: params[:page],per_page: 5)
  end

end