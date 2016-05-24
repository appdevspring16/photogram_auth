class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

        #  User
        #  username: presence, uniqueness
  validates :username, :presence=>true, :uniqueness=>true

has_many :liked_photos, :through => :likes, :source => :photo

has_many :photos
has_many :comments
has_many :likes
end
