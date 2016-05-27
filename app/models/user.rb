class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, :presence => true

  has_many :likes, :class_name => "Like", :foreign_key => "user_id"

  has_many :photos, :class_name => "Photo", :foreign_key => "user_id"

  has_many :comments, :class_name => "Comment", :foreign_key => "user_id"
end
