class RemoveCitiesFromListings < ActiveRecord::Migration[6.0]
  def change
    remove_column :listings, :cities
  end
end
