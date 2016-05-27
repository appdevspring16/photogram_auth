class Photo < ActiveRecord::Base

validates :user_id, :presence => true
belongs_to :user
has_many :comments
has_many :likes
has_many :fans, :through => :likes, :source => :user

end
