class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  # Validation
  validates :username, :presence => true, :uniqueness => true

  # Associations
  # - Users have many photos, a photo belongs to a user
      has_many :photos, :dependent => :destroy
  # - Users have many comments, a comment belongs to a user
      has_many :comments, :dependent => :destroy

  # - Users have many likes, a like belongs to a user
      has_many :likes, :dependent => :destroy

  # - Users have many liked_photos through likes - we'll have to write out the full form of the has_many/through:
      has_many :liked_photos, :through => :likes, :source => :photo
end
