class CartsController < ApplicationController
  def index
    if current_user.cart
      @cart = current_user.cart.listings
    else
      redirect_to listings_path
    end
  end

  def create
    if !current_user.cart
      cart = Cart.create(user_id: current_user.id)
    else
      cart = current_user.cart
    end
    listing = Listing.find(params[:listing_id])
    cart.listings << listing
    redirect_to to listings_path
  end
end
