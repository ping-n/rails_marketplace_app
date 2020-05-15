class CartsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  def index
    if current_user.cart
      @cart = current_user.cart.listings
    else
      redirect_to listings_path
    end
  end

  def create
    cart = if !current_user.cart
             Cart.create(user_id: current_user.id)
           else
             current_user.cart
           end
    listing = Listing.find(params[:listing_id])
    cart.listing_carts.create(listing: listing)
    redirect_to listings_path
  end
end
