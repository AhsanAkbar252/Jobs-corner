class UsersController < ApplicationController
  before_action :authenticate_user!
def index
  redirect_to  profiles_path
end
end