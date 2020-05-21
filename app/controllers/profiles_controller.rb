class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[show edit]
  before_action :authenticate_user!
  load_and_authorize_resource

  def show; end

  def edit; end

  def update
    @user = current_user.profile
    scope = nil
    scope = :user if profile_params.key?(:user)
    scope = :profile if profile_params.key?(:profile)
    if @user.update(profile_params[scope])
      redirect_to dashboard_path
    else
      render 'edit'
    end
  end

  private

  def profile_params
    params.permit(user: %i[
                    first_name
                    surname
                    location
                    user_id
                    description
                  ], profile: %i[
                    first_name
                    surname
                    location
                    user_id
                    description
                  ])
  end

  def set_profile
    @user = current_user
  end
end
