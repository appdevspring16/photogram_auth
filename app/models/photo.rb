class Photo < ActiveRecord::Base

  validates :user_id, :presence => true
  has_many :comments
  belongs_to :user
  has_many :likes
  has_many :fans, :through => :likes, :source => :user
end
