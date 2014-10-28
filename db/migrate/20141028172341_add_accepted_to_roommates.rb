class AddAcceptedToRoommates < ActiveRecord::Migration
  def change
    add_column :roommates, :accepted, :boolean, default: false
  end
end
