# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]


  # GET /resource/sign_up
  def new
    super
  end

  # POST /resource
def create
  if !verify_recaptcha
    redirect_to new_user_registration_path
    flash.delete(:recaptcha_error)
    flash[:danger] = "reCAPTCHA verification failed" 
  else
    flash.delete :recaptcha_error
    super
  end
end

  # GET /resource/edit
  def edit
    super
  end

  # PUT /resource
  def update
    super
  end

  # DELETE /resource
  def destroy
    @job_applications = JobApplication.all
    if current_user.profile != nil
      current_user.profile.destroy
    end
    current_user.jobs.each do|job|
      @job_applications.each do|app|
        job.job_applications.each do|job_application|
          if job_application == app
            app.destroy
          end
        end
      end
      job.destroy
    end
    @job_applications.each do|app|
      current_user.job_applications.each do|job_application|
        if job_application == app
          app.destroy
        end
      end
   end
   super
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email,:username,:password])
    # params.require(:user).permit(:username,:password)
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:email,:username,:password])
  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
