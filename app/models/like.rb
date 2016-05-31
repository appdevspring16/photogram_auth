class Like < ActiveRecord::Base
  validates :user_id, :presence => true,
  :uniqueness => {:scope => :photo_id}
  validates :photo_id, :presence => true

  belongs_to :user_id
  belongs_to :photo_id

end
