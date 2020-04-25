class Photo < ActiveRecord::Base


has_many :comments, :class_name => "Comment", :foreign_key => "photo_id"
has_many :likes
belongs_to :user, :class_name => "User", :foreign_key => "user_id"
has_many :fans, :through => :likes, :source => :user


end
