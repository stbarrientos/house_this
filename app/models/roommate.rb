class Roommate < ActiveRecord::Base
  belongs_to :user
  belongs_to :room

  validates :user_id, presence: true
  validates :room_id, presence: true
  validates :accepted, inclusion: { in: [true, false] }
end
