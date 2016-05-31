class User < ActiveRecord::Base
validates :name, :presence => true,
            :uniqueness => {:scope => :user_id}

   has_many :photos
   has_many :likes
   has_many :comments

   has_many :liked_photos, :through => :likes, :source => :photo
end
