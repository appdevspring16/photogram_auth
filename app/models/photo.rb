class Photo < ActiveRecord::Base

  validates :user_id, :presence => true

  has_many :liked_photos, :through => :likes, :source => :photo
  
end
