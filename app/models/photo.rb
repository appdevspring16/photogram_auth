class Photo < ActiveRecord::Base

  # user_id: must be present
  validates :user_id, :presence => true

  has_many :comments
  has_many :likes
  belongs_to :user
  has_many :fans, :through => :likes, :source => :user

  mount_uploader :image, ImageUploader

end
