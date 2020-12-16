class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :valid_user, only: [:edit,:update,:destroy]
  def new
    @profile = Profile.new()
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id
    if(@profile.save) 
      flash[:success] = "Your Profile is created successfully"
      redirect_to profiles_path
    else
      render "new"
    end

  end

  def edit
    @profile = Profile.find(params[:id])
  
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
      flash[:success] = "Profile is updated successfully"
      redirect_to profiles_path
    else
      render 'edit'
      flash[:error] = @profile.errors.full_messages
    end

  end

  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy
    flash[:danger] = "Profile is deleted successfully"
    redirect_to profiles_path

  end

  def valid_user
    @profile = Profile.find(params[:id])
    if current_user !=  @profile.user
      flash[:danger]= "You cannot perform this action"
      redirect_to root_path
    end

  end

  def index
    @profiles = Profile.all
      if params[:search_country].present? || params[:search_city].present? || params[:search_name].present? || params[:search_profession].present? || params[:search_company].present?
      if params[:search_country].present?
        @profiles = @profiles.where(country: params[:search_country])
      end
      if params[:search_city].present?
        @profiles = @profiles.where(city: params[:search_city])
      end
      if params[:search_name].present?
       @profiles = @profiles.where("lower(name) like ?","%#{params[:search_name].downcase}%")
      end
      if params[:search_profession].present?
        @profiles = @profiles.where("lower(profession) like ?","%#{params[:search_profession].downcase}%")
      end
      if params[:search_company].present?
        @profiles = @profiles.where("lower(working_at) like ?","%#{params[:search_company].downcase}%")
      end
      @profiles = @profiles.paginate(page: params[:page],per_page: 5)
    else
      @profiles = @profiles.paginate(page: params[:page],per_page: 5)
    end
  end

  def profile_params
    params.require(:profile).permit(:name,:qualification,:profession,:experience,:skills,:personal_info,:avatar,:address,:city,:country,:experience_detail,:working_at,:user_id,:interests,:user_email)

  end

  def show
    @profile = Profile.find(params[:id])
    @profiles = Profile.all
  end
end