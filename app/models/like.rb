class Like < ActiveRecord::Base

  # user_id: must be present; must be unique in combination with photo_id
  validates :user_id, :presence => true, :uniqueness => { :scope => :photo_id }

  # photo_id: must be present
  validates :photo_id, :presence => true

  belongs_to :user
  belongs_to :photo

end
