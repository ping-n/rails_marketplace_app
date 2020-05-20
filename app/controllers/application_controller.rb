class ApplicationController < ActionController::Base
  before_action :set_query
  rescue_from CanCan::AccessDenied do |_exception|
    render file: Rails.root.join('public/403.html'), status: :forbidden
  end

  # setting ransack so that search function in navbar
  def set_query
    # setting up eager loading for images when search
    @q = Listing.with_attached_picture.ransack(sold_eq: false)
  end
end
