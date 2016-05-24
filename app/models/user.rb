class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  validates :username, presence:true, uniqueness:true


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :liked_photos, :through => :likes, :source => :photo
  has_many :comments
  has_many :likes
  # Users have many photos, a photo belongs to a user
  # Users have many comments, a comment belongs to a user
# Users have many likes, a like belongs to a user
end
