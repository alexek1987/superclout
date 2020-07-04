class Listing < ApplicationRecord
  belongs_to :brand
  has_one_attached :photo
  validates :product, presence: :true
  validates :description, presence: :true
end
