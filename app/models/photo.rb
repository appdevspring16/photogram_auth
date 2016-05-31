class Photo < ActiveRecord::Base
  # associations with comments, likes
  has_many :comments
  has_many :likes

  # associations with fans
  has_many :fans, :through => :likes, :source => :user

  # belongs to user
  belongs_to :user

  # validates presence
  validates :user_id, :presence => true


end
