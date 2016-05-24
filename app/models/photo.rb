class Photo < ActiveRecord::Base


  validates :user_id, presence:true


belongs_to :user
has_many :comments
has_many :likes
has_many :fans, :through => :likes, :source => :user

  #   Users have many photos, a photo belongs to a user
  # Photos have many comments, a comment belongs to a photo
  # Users have many comments, a comment belongs to a user
  # Users have many likes, a like belongs to a user
  # Photos have many likes, a like belongs to a photo
end
