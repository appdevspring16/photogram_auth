class Like < ActiveRecord::Base


validates :user_id, presence:true, uniqueness: {:scope => :photo_id}
validates :photo_id, presence:true

  belongs_to :photo
  belongs_to :user

  #   Users have many photos, a photo belongs to a user
  # Photos have many comments, a comment belongs to a photo
  # Users have many comments, a comment belongs to a user
  # Users have many likes, a like belongs to a user
  # Photos have many likes, a like belongs to a photo
end
