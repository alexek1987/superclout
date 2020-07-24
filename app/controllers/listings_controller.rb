class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :destroy]

  def index
    @brands = Brand.all
    @listings = Listing.all
    @campaign = Campaign.new
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    @brand = Brand.find(params[:brand_id])
    @listing.brand = @brand
    authorize @listing
    if @listing.save
      redirect_to brand_path(@brand)
    else
      render "brands/show"
    end
  end

  def destroy
    @listing.destroy
  end

  def show
    @campaign = Campaign.new
  end

  # def edit
  # end

  # def update
  #   if @listing.update(listing_params)
  #     redirect_to brand_path(@brand)
  #   else
  #     render :edit
  #   end
  # end

  private
  def set_listing
    @listing = Listing.find(params[:id])
    authorize @listing
  end

  def listing_params
    params.require(:listing).permit(:product, :description, :photo)
  end
end
