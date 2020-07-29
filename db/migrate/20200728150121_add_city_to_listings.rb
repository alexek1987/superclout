class AddCityToListings < ActiveRecord::Migration[6.0]
  def change
    add_column :listings, :city, :string
  end
end
