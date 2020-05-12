class ListingsController < ApplicationController
  before_action :set_listing, only: %i[show edit update destroy]
  def index
    @listings = Listing.all
  end

  def show; end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.create(listing_params)
    if @listing.errors.any?
      render :new
    else
      flash[:success] = 'You successfully added a new listing'
      redirect_to root_path
    end
  end

  def edit; end

  def update
    if @listing.update(listing_params)
      redirect_to @listing
    else
      render :edit
    end
  end

  def destroy
    @listing.destroy
    redirect_to root_path
  end

  private

  def listing_params
    params.require(:listing).permit(
      :name,
      :brand,
      :price,
      :sold,
      :condition,
      :user_id,
      :picture
    )
  end

  def set_listing
    @listing = listing.find(params[:id])
  end
end
