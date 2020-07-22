class BrandsController < ApplicationController
   before_action :set_brand, only: [:show, :edit, :update, :destroy]
  def index
    @brands = Brand.all
  end

  def show
    @listings = @brand.listings
    @listing = Listing.new
  end

  def new
    @brand = Brand.new
    authorize @brand
  end

  def create
    @brand = Brand.new(brand_params)
    authorize @brand
    if @brand.save
      redirect_to brand_path(@brand)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @brand.update(brand_params)
      redirect_to brand_path(@brand)
    else
      render :edit
    end
  end

  def destroy
    @brand.destroy
  end

  private

  def set_brand
    @brand = Brand.find(params[:id])
    authorize @brand
  end

  def brand_params
    params.require(:brand).permit(:name, :photo)
  end
end
