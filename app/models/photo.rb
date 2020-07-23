class Photo < ActiveRecord::Base


  # Photo
  # user_id: presence
  validates :user_id, :presence=>true



  has_many :fans, :through => :likes, :source => :user

  belongs_to :user

  has_many :comments
  has_many :likes
end
