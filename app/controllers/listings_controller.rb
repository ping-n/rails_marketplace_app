class ListingsController < ApplicationController
  before_action :set_listing, only: %i[show edit update destroy]
  before_action :set_condition, only: %i[new edit]
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @listings = Listing.all
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
      redirect_to root_path
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
