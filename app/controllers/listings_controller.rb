class ListingsController < ApplicationController


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
    authorize @listing
  end

  def show
    @listing = Listing.find(params[:id])
  end

private
  def listing_params
    params.require(:listing).permit(:product, :description, :photo)
  end
end
