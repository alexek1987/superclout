class BrandsController < ApplicationController
   before_action :set_brand, only: [:new, :create, :show, :edit, :update, :destroy]
  def index
    @brands = Brand.all
  end

  def show
    @brand = Brand.find(params[:id])
    @listings = @brand.listings
    @listing = Listing.new
    authorize @brand
  end

  def new
    @brand = Brand.new
     authorize @brand
  end

  def create
    authorize @brand
    @brand = Brand.new(brand_params)
    if @brand.save
      redirect_to brand_path(@brand)
    else
      render :new
    end

    def edit
      authorize @brand
    end

    def update
      authorize @brand
    end

    def destroy
      authorize @brand
    end
  end

private

def set_brand
   @brand = Brand.new
end

  def brand_params
    params.require(:brand).permit(:name, :photo)
  end
end
