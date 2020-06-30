class ListingsController < ApplicationController
  def create
    @listing = Listing.new(listing_params)
    @brand = Brand.find(params[:brand_id])
    @listing.brand = @brand
    if @listing.save
      redirect_to brand_path(@brand)
    else
      render "brands/show"
  end
end

  def destroy
  end

  def show
  end

private
  def listing_params
    params.require(:listing).permit(:product, :photo)
  end
end
