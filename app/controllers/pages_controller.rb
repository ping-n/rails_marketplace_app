class PagesController < ApplicationController
  def index
    # Eager loaded picture from active storage
    @q = Listing.ransack(sold_eq: false)
    # Limiting DB Query to include category and limit search to 3 listing
    @listings = @q.result.with_attached_picture.includes(:category).limit(3)
  end
end
