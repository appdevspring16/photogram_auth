class Comment < ActiveRecord::Base

  validates :user, :presence => true
  validates :photo, :presence => true
  validates :body, :presence => true

  belongs_to :user
	belongs_to :photo

end
