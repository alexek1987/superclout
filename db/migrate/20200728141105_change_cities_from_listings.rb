class ChangeCitiesFromListings < ActiveRecord::Migration[6.0]
  def change
    change_column :listings, :cities, :string, :default => ""

  end
end
