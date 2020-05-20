class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[show edit update]
  before_action :authenticate_user!
  load_and_authorize_resource

  def show; end

  def edit; end

  def update
    @user.profile.update(
      profile_params
    )
    redirect_to profile_path
  end

  private

  def profile_params
    params.require(:profile).permit(
      :first_name,
      :surname,
      :location,
      :user_id,
      :description
    )
  end

  def set_profile
    @user = current_user
  end
end
