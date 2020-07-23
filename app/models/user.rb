class User < ActiveRecord::Base

validates :username, :presence => true,
            :uniqueness => true

   has_many :photos
   has_many :likes
   has_many :comments

   has_many :liked_photos, :through => :likes, :source => :photo

end
