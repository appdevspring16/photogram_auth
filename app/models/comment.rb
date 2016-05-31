class Comment < ActiveRecord::Base

  validates :user_id, :presence => true
  validates :photo_id, :presence => true
  validates :body_id, :presence => true

  belongs_to :user_id
  belongs_to :photo_id
end
