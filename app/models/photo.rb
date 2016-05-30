class Photo < ActiveRecord::Base

  has_many :fans, :through => :likes, :source => :user
  has_many(:comments, :class_name=>"Comment", :foreign_key=>"photo_id")
  has_many(:likes, :class_name=>"Like", :foreign_key=>"photo_id")

  belongs_to(:user, :class_name=>"User", :foreign_key =>"user_id")

  validates :user_id, presence:true
end
