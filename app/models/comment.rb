class Comment < ActiveRecord::Base

  validates :user_id, :presence => true

  validates :photo_id, :presence => true

  validates :body, :presence => true

  belongs_to :photo, :class_name => "Photo", :foreign_key => "user_id"

  belongs_to :user, :class_name => "User", :foreign_key => "user_id"

end
