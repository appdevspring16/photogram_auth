class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # association with photos, comments, likes
  has_many :photos
  has_many :comments
  has_many :likes

  # association with liked photos
  has_many :liked_photos, :through => :likes, :source => :photo

  #validates presence, uniqueness
  # validates :username, :presence => true, :uniqueness => true







end
