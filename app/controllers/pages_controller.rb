class PagesController < ApplicationController
  def index
    # Limiting database to only show 3 listings
    @listings = Listing.limit(3)
  end
end
