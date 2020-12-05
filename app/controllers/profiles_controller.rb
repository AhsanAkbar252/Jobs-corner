class ProfilesController < ApplicationController
  before_action :authenticate_user!
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

  def index
    @profiles = Profile.paginate(page: params[:page],per_page: 8)
  end

  def profile_params
    params.require(:profile).permit(:name,:qualification,:profession,:experience,:skills,:personal_info,:avatar,:address,:city,:country,:experience_detail,:working_at,:user_id,:interests)

  end

  def show
    @profile = Profile.find(params[:id])
    @profiles = Profile.all
  end
end