class Listing < ApplicationRecord
  belongs_to :brand
  validates :product, :image_url, presence: :true
end
