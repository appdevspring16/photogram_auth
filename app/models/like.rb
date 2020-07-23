class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :photo

  # user_id must be present and unique in combination with photo
  validates :user_id, :presence => true, :uniqueness => { :scope => :photo }

  # photo_id must be present
  validates :photo_id, :presence => true

end
