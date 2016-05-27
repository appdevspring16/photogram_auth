class Photo < ActiveRecord::Base

  validates :user_id, :presence => true

  belongs_to :user

  has_many :liked_photos, :through => :likes, :source => :photo

  # has_many :likes, :class_name => "Like", :foreign_key => "photo_id"
  has_many :comments, :class_name => "Comment", :foreign_key => "photo_id"
end
