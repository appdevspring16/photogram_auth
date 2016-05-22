class Photo < ActiveRecord::Base


  # user_id: presence
  validates :user_id, presence: true

  belongs_to :user

  has_many :likes
  has_many :comments
  has_many :fans, :through => :likes, :source => :user

end
