class Like < ActiveRecord::Base

  validates :user_id, :presence => true, :uniqueness => { :scope => :photo_id}
  validates :photo_id, :presence => true

  has_many :likes, :class_name => "Like", :foreign_key => "user_id"

end
