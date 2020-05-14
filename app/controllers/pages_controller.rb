class PagesController < ApplicationController
  def index
    @listings = Listing.where(sold: false)
  end
end
