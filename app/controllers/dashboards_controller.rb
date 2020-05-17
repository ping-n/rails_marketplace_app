class DashboardsController < ApplicationController
  before_action :authenticate_user!
  def show
    user = User.find(params[:id])
    @listings = user.listings
    @profile = user.profile
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
