class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :photo
  validates :user_id, :presence => true, :uniqueness => {:scope => :photo}
  validates :photo_id, :presence => true
end
