class Photo < ActiveRecord::Base

  validates :user, :presence => true

  belongs_to :user

  has_many :comments, :dependent => :destroy
  has_many :likes, :dependent => :destroy

  has_many :fans, :through => :likes, :source => :user

end
