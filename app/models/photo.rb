class Photo < ActiveRecord::Base
<<<<<<< HEAD

validates :user_id, :presence => true

  belongs_to :user_id

  has_many :comments
  has_many :likes
  has_many :fans, :through => :likes, :source => :user
=======
>>>>>>> parent of ab478b6... updated
end
