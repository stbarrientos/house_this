class CreateRoommates < ActiveRecord::Migration
  def change
    create_table :roommates do |t|
      t.belongs_to :user
      t.belongs_to :room
    end
  end
end
