class Photo < ActiveRecord::Base

  has_many :fans, :through => :likes, :source => :user
  has_many :comments, :dependent => :destroy
  has_many :likes, :dependent=> :destroy

  belongs_to :user

  validates :user, presence:true
  validates :image, presence:true

end
