class PagesController < ApplicationController
  def index
    # Limiting database to only show 3 listings
    @q = Listing.ransack(sold_eq: false)
    @listings = @q.result(distinct: true).limit(3)
  end
end
