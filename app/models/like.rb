class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :photo
  belongs_to :current_user
  validates :user_id, :presence => true, :uniqueness => {:scope => :photo}
  validates :photo_id, :presence => true
end
