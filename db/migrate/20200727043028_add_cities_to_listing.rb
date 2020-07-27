class AddCitiesToListing < ActiveRecord::Migration[6.0]
  def change
    add_column :listings, :cities, :text, array: true, default: []
  end
end
