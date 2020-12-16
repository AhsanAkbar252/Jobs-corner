class FeedbacksController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!, only: [:show,:index,:destroy]
  def new
    @feedback = Feedback.new
  end

  def create
   if !verify_recaptcha
      flash.delete :recaptcha_error
      build_resource(sign_up_params)
      resource.valid?
      resource.errors.add(:base, "There was an error with the recaptcha code below. Please re-enter the code.")
      clean_up_passwords(resource)
      respond_with_navigational(resource) { render_with_scope :new }
    else
      flash.delete :recaptcha_error
      @feedback = Feedback.new(feedback_params)
      if(@feedback.save)
        flash[:success] = "feeedback is submitted successfully"
        redirect_to new_feedback_path
      else
        render 'new'
        flash[:error] = @feedback.errors.full_messages
      end
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