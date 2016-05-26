class Comment < ActiveRecord::
  belongs_to :photo
  belongs_to :user

  # user_id must be present
  validates :user_id, :presence => true

  # photo_id must be present
  validates :photo_id, :presence => true

  # body must be present
  valideates :body, :presence => true

end
