class Photo < ActiveRecord::Base

has_many :comments
has_many :likes
has_many :fans, :through => :likes, :source => :user
belongs_to :user, :class_name => "User", :foreign_key => "user_id"
belongs_to :photo, :class_name => "Photo", :foreign_key => "photo_id"

validates :user_id, :presence => true


end
