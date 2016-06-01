class Photo < ActiveRecord::Base
  # Photo
  # user_id: presence
  validates :user_id, :presence => true
end
