class Photo < ActiveRecord::Base
has_many :comments
has_many :fans, :through => :likes, :source => :user
belongs_to :user
validates :user_id, :presence => true
end
