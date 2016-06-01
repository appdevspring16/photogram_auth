class Photo < ActiveRecord::Base

  belongs_to :user
  
  has_many :comments, :class_name => "Photo", :foreign_key => "photo_id", :dependent => destroy
  has_many :fans, :through => :likes, :source => :user
end
