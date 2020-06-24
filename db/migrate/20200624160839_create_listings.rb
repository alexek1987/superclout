class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.string :product
      t.string :image_url
      t.references :brand, null: false, foreign_key: true

      t.timestamps
    end
  end
end
