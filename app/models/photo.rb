class Photo < ActiveRecord::Base

  has_many :fans, :through => :likes, :source => :user
  has_many :comments, :through => :likes, :source => :user
end
