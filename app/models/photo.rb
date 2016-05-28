class Photo < ActiveRecord::Base

  belongs_to :user
  has_many :comment
  has_many :likes
  has_many :fans, :through => :likes, :source => :user
end
