class Like < ActiveRecord::Base

  validates :user_id, presence:true, uniqueness:{scope: :photo_id, message:"Only one user can have this photo id"}
  validates :photo_id, presence:true

  belongs_to(:user, :class_name=>"User", :foreign_key =>"user_id")
  belongs_to(:photo, :class_name=>"Photo", :foreign_key =>"photo_id")
  
end
