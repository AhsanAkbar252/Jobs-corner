class FeedbacksController < ApplicationController
  before_action :authenticate_user!
  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)
    if(@feedback.save)
      flash[:success] = "Job is posted successfully"
      redirect_to feedbacks_path
    else
      render 'new'
      flash[:error] = @feedback.errors.full_messages
    end
  end

  def show
    @feedback = Feedback.find(params[:id])
  end

  def destroy
    @feedback = Feedback.find(params[:id])
    @feedback.destroy
    flash[:danger] = "Job is deleted successfully"
    redirect_to feedbacks_path
  end

  def index
    @feedbacks =Feedback.paginate(page: params[:page],per_page: 8)
  end


  def feedback_params
    params.require(:feedback).permit(:username,:email,:message)
  end

end