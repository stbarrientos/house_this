class User < ActiveRecord::Base
  has_many :roommates
  has_many :rooms, through: :roommates
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
