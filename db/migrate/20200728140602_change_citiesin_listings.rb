class ChangeCitiesinListings < ActiveRecord::Migration[6.0]
  def change
    change_column :listings, :cities, :string

  end
end
