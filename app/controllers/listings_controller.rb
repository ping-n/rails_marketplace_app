class ListingsController < ApplicationController
  before_action :set_listing, only: %i[show edit update destroy]
  before_action :set_condition, only: %i[new edit]
  before_action :authenticate_user!, except: %i[index show]
  load_and_authorize_resource

  def index
    # Query the DB for where listing.sold == false
    @q = Listing.ransack(sold_eq: false)
    @listings = @q.result(distinct: true)
  end

  def show; end

  def new
    @listing = Listing.new
  end

  def create
    @listing = current_user.listings.create(listing_params)
    if @listing.errors.any?
      set_condition
      render :new
    else
      flash[:success] = 'You successfully added a new listing'
      redirect_to listings_path
    end
  end

  def edit; end

  def update
    if @listing.update(listing_params)
      set_condition
      redirect_to @listing
    else
      render :edit
    end
  end

  def destroy
    @listing.destroy
    flash[:success] = 'You successfully deleted the listing'
    redirect_to listings_path
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
      :category_id,
      :picture
    )
  end

  def set_listing
    @listing = Listing.find(params[:id])
  end

  def set_condition
    @conditions = Listing.conditions.keys
  end
end
