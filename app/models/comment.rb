class Comment < ActiveRecord::Base
  validates :user_id, :photo_id, :body, presence: true
  belongs_to :photo
  belongs_to :user
end
