class Comment < ActiveRecord::Base

belongs_to :photo
belongs_to :user

validates :photo_id, presence:true
validates :user_id, presence:true
validates :body, presence:true

# user_id: presence
# photo_id: presence
# body: presence
#   Users have many photos, a photo belongs to a user
# Photos have many comments, a comment belongs to a photo
# Users have many comments, a comment belongs to a user
# Users have many likes, a like belongs to a user
# Photos have many likes, a like belongs to a photo
end
