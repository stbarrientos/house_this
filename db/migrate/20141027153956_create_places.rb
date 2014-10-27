class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.belongs_to :room
      t.string :url
      t.integer :rank
      t.string :address
      t.float :price
      t.float :beds
      t.float :baths
      t.string :amenities
    end
  end
end
