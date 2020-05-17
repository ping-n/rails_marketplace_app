class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[show edit update]
  before_action :authenticate_user!
  load_and_authorize_resource

  def show; end

  def edit; end

  def update
    @profile.update(
      profile_params
    )
    redirect_to
  end

  private

  def profile_params
    params.require(:user_info).permit(
      :first_name,
      :surname,
      :location,
      :user_id
    )
  end

  def set_profile
    @profile = current_user.user_info
  end
end
