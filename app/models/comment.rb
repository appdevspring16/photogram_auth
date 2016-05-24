class Comment < ActiveRecord::Base

# Comment
# user_id: presence
validates :user_id, :presence=>true
# photo_id: presence
validates :photo_id, :presence=>true
# body: presence
validates :body, :presence=>true

belongs_to :photo
belongs_to :user
end
