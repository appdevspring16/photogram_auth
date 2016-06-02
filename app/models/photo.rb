class Photo < ActiveRecord::Base

  has_many :fans, :through => :likes, :source => :user
  has_many :comments
  belongs_to :user
  has_many :likes

  validates :user_id, :presence => true

end
