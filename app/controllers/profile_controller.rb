class ProfileController < ApplicationController
  before_filter :authenticate_user!
  before_filter :assign_user

  def show
  end

  def update
    @user.avatar = params[:file]
    @user.update_attributes(params[:user])
    redirect_to profile_path
  end

  private

  def assign_user
    @user = current_user
  end

end
