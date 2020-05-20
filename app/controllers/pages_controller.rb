class PagesController < ApplicationController
  def index
    # Eager loaded picture from active storage
    @q = Listing.with_attached_picture.ransack(sold_eq: false)
    # Limiting DB Query to include category and limit search to 3 listing
    @listings = @q.result.includes(:category).limit(3)
  end
end
