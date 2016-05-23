class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, presence: true
  validates :username, uniqueness: true

  has_many :photos
  has_many :users
  has_many :likes
  has_many :liked_photos, :through => :likes, :source => :photo
end
