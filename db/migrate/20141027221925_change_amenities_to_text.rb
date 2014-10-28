class ChangeAmenitiesToText < ActiveRecord::Migration
  def change
    remove_column :places, :amenities, :string
    add_column :places, :amenities, :text
  end
end
