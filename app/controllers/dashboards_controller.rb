class DashboardsController < ApplicationController
  before_action :authenticate_user!
  def show
    user = User.find(params[:id])

    @listings = user.listings.with_attached_picture.includes(:category)
    @profile = user.profile
  end
end
