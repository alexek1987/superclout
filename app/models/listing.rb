class Listing < ApplicationRecord
  has_one_attached :photo
  belongs_to :brand
  validates :product, presence: :true
end
