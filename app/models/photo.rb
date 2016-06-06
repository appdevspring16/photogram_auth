class Photo < ActiveRecord::Base

  # Validation
  validates :user, :presence => true


  # Associations

  # a photo belongs to a user
      belongs_to :user
  # Photos have many comments, a comment belongs to a photo
      has_many :comments, :dependent => :destroy
      # every has_many has an option to delete the rest of the stuff after the main object was deleted

  # Photos have many likes, a like belongs to a photo
      has_many :likes, :dependent => :destroy

  # Photos have many fans through likes (source: user):
      has_many :fans, :through => :likes, :source => :user

end
