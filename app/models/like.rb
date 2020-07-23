class Like < ActiveRecord::Base
  # Like
  # user_id: presence, uniqueness in combination with photo
  validates :user_id, :presence => true, :uniqueness => { :scope => :photo_id }
  # photo_id: presence
  validates :photo_id, :presence => true

  # association
  belongs_to(:user, :class_name => "User", :foreign_key => "user_id")
  belongs_to(:photo, :class_name => "Photo", :foreign_key => "photo_id")

end
