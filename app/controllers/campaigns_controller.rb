class CampaignsController < ApplicationController
    before_action :set_campaign, only: [:show, :destroy]
  
    def index
      @campaigns = Campaign.all
    end
  
    def new
      @campaign = Campaign.new
    end
  
    def create
      @campaign = Campaign.new(campaign_params)
      @listing = Listing.find(params[:listing_id])
      @user = current_user
      @campaign.listing = @listing
      @campaign.user = @user
      authorize @campaign
      if @campaign.save
        redirect_to campaign_path(@campaign), notice: "Campaign requested"
      else
        render "listings/index", alert: "Campaign couldn't be requested"
      end
    end
  
    def destroy
      @campaign.destroy
    end
  
    def show
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
    def set_campaign
      @campaign = Campaign.find(params[:id])
      authorize @campaign
    end
  
    def campaign_params
      params.require(:campaign).permit(:status)
    end
  end
  