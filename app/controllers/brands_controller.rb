class BrandsController < ApplicationController

   skip_before_action :authenticate_user!, only: [:index]

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
    @brand = Brand.new
    authorize @brand
  end

  def brand_params
    params.require(:brand).permit(:name, :photo)
  end
end
