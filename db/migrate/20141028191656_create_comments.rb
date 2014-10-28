class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :user
      t.belongs_to :place
      t.text :body
    end
  end
end
