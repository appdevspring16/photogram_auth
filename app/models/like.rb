class Like < ActiveRecord::Base
  # adds association with user, photo
  belongs_to :user
  belongs_to :photo

  # adds validations for likes
  validates :user_id, :presence => true, :uniqueness => { :scope => :photo }
  validates :photo_id, :presence => true

end
