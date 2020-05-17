class ApplicationController < ActionController::Base
  before_action :set_query
  rescue_from CanCan::AccessDenied do |_exception|
    render file: Rails.root.join('public/403.html'), status: :forbidden
  end

  def set_query
    @q = Listing.ransack(params[:q])
  end
end
