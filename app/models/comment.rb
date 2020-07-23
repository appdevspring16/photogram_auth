class Comment < ActiveRecord::Base
  belongs_to :photo
  belongs_to :user

  validates :user_id, presence: true
  validates :photo_id, presence: true
  validates :body, presence: true
end
