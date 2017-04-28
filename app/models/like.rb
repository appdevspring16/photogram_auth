class Like < ActiveRecord::Base

  belongs_to :users
  belongs_to :photos


  validates :user_id, :presence => true

  validates :photo_id, :presence => true
end
