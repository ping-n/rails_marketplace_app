class CartsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  def index
    if user_signed_in? && current_user.carts.last
      @cart = current_user.carts.last.listings
      @listing_ids = @cart.map(&:id)
    else
      flash[:alert] = 'The Cart is empty'
      redirect_to listings_path
    end
  end

  def create
    cart = if current_user.carts.empty?
             Cart.create(completed: false, user_id: current_user.id)
           else
             current_user.carts.last
           end
    listing = Listing.find(params[:listing_id])
    cart.listings << listing
    redirect_to listings_path
  end

  def destroy
    cart = current_user.carts.last
    @product = cart.listing_carts.find_by(listing_id: params[:listing_id]).id
    ListingCart.destroy(@product)
    flash[:success] = 'removed from cart'
    redirect_to carts_path
  end
end
