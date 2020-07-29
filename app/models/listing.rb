class Listing < ApplicationRecord
  belongs_to :brand
  has_one_attached :photo
  validates :product, presence: :true
  validates :description, presence: :true
  validates :city, presence: :true
  validate :valid_city

  def valid_city
    if self.city.downcase != "global"
      result = Geocoder.search(city)
      if result[0]
        self.city = result[0].city if result[0].city
      else
        errors.add(:city, "is not a valid city name.")
      end
    elsif self.city.downcase == "global"
      self.city = "Global"
    end
  end
end
