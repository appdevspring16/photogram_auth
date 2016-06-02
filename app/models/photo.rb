class Photo < ActiveRecord::Base
  has_many :fans, :through => :likes, :source => :user
  validates :user_id, :presence=>true
end
