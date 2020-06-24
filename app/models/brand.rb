class Brand < ApplicationRecord
  has_many :listings
  validates :name, :banner_url, presence: true
end
