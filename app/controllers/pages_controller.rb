class PagesController < ApplicationController
  def index
    @listings = Listing.all
  end
end
