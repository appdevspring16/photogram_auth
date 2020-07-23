class Photo < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :likes
  has_many :fans, :through => :likes, :source => :user

  # Photo must be present
  validates :user_id, :presence => true


end
