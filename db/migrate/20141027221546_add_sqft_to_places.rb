class AddSqftToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :sqft, :float
  end
end
