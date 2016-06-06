class Comment < ActiveRecord::Base

  # Validations
  validates :user, :presence => true
  # but it is better to validate the :user instead of :user_id
  validates :photo, :presence => true
  # but it is better to validate the :photo instead of :photo_id
  validates :body, :presence => true


  # Associations

  # a comment belongs to a user
  belongs_to :user
  # a comment belongs to a photo
  belongs_to :photo
end
