class Like < ActiveRecord::Base
<<<<<<< HEAD
  validates :user_id, :presence => true,
  :uniqueness => {:scope => :photo_id}
  validates :photo_id, :presence => true

  belongs_to :user
  belongs_to :photo

=======
>>>>>>> parent of ab478b6... updated
end
