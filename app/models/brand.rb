class Brand < ApplicationRecord
  has_one_attached :photo
  has_many :listings
  validates :name, presence: true
end
