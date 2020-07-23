class Photo < ActiveRecord::Base
  has_many :comments, :class_name => "Comment", :foreign_key => "photo_id"
  belongs_to :user, :class_name => "User", :foreign_key => "user_id"
  has_many :likes
  has_many :fans, :through => :likes, :source => :user
  validates :user_id, :presence => true
  validates :caption, :presence => true
  end
