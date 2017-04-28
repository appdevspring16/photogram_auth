class Like < ActiveRecord::Base
  belongs_to :photo, :class_name => "Photo", :foreign_key => "photo_id"
  belongs_to :user, :class_name => "User", :foreign_key => "user_id"

  validates :photo_id, :presence => true
  validates :user_id, :presence => true, :uniqueness => { :scope => :photo }
end
