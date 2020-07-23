class Comment < ActiveRecord::Base
  # adds association with photo, user
  belongs_to :photo
  belongs_to :user

  # adds validations for presence
  validates :user_id, :presence => true
  validates :photo_id, :presence => true
  validates :body, :presence => true

end
