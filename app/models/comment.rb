class Comment < ActiveRecord::Base

  validates :user_id, :photo_id, :body, presence:true
  belongs_to(:photo, :class_name=>"Photo", :foreign_key =>"photo_id")
  belongs_to(:user, :class_name=>"User", :foreign_key =>"user_id")

end
