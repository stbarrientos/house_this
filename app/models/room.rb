class Room < ActiveRecord::Base
  has_many :roommates
  has_many :places
  has_many :users, through: :roommates

  validates :name, presence: true
end
